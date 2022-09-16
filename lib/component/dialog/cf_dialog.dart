import 'dart:async';
import 'dart:io' as io;
import 'package:auto_route/auto_route.dart';
import 'package:eros_n/common/const/const.dart';
import 'package:eros_n/common/global.dart';
import 'package:eros_n/utils/logger.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';

const kDialogTag = 'InAppWebViewDialog';

// 使用请求nh主页，获取cookie更新到cookieJar
Future<void> showInAppWebViewDialog({
  int? statusCode,
  FutureOr Function()? onComplete,
}) async {
  final CookieManager cookieManager = CookieManager.instance();
  await cookieManager.deleteAllCookies();
  final showWebview = !kReleaseMode;
  // final showWebview = false;

  Widget dialogBuilder(BuildContext context) {
    Widget iw() => InAppWebView(
          initialUrlRequest: URLRequest(
            url: Uri.parse(NHConst.baseUrl),
          ),
          initialOptions: inAppWebViewOptions,
          shouldOverrideUrlLoading: (controller, navigationAction) async {
            final uri = navigationAction.request.url!;

            logger.d('to $uri');

            return NavigationActionPolicy.ALLOW;
          },
          onLoadStop: (InAppWebViewController controller, Uri? uri) async {
            logger.d('Page onLoadStop: $uri');
            if (uri == null) {
              return;
            }

            // 使用javascript获取Webview的userAgent
            final resultJS = await controller.evaluateJavascript(
                source: 'navigator.userAgent;');
            logger.d('resultJS $resultJS');
            final userAgent = resultJS.toString();
            Global.userAgent = userAgent;
            globalDioConfig =
                globalDioConfig.copyWith(userAgent: Global.userAgent);
            hiveHelper.setUserAgent(Global.userAgent!);

            final cookies = await cookieManager.getCookies(url: uri);
            logger
                .d('cookies:\n${cookies.map((e) => e.toString()).join('\n')}');
            if (cookies.length >= 2 &&
                cookies.any((element) => element.name == 'csrftoken')) {
              final ioCookies =
                  cookies.map((e) => io.Cookie(e.name, '${e.value}')).toList();

              SmartDialog.dismiss(result: ioCookies, tag: kDialogTag);
            }
          },
        );

    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: Container(
        color: Theme.of(context).colorScheme.surface,
        alignment: Alignment.center,
        width: 100,
        height: 100,
        child: Stack(
          // mainAxisSize: MainAxisSize.min,
          alignment: Alignment.center,
          children: [
            SizedBox(
              height: 100,
              child: iw(),
            ),
            Container(
              alignment: Alignment.center,
              color: showWebview
                  ? Theme.of(context).colorScheme.surface.withOpacity(0.5)
                  : Theme.of(context).colorScheme.surface,
              child: const CircularProgressIndicator(),
            ),
          ],
        ),
      ),
    );

    // return AlertDialog(
    //   content: Column(
    //     mainAxisSize: MainAxisSize.min,
    //     children: [
    //       if (!showWebview) const CircularProgressIndicator(),
    //       SizedBox(
    //         height: showWebview ? 200 : 0.1,
    //         child: iw(),
    //       ),
    //     ],
    //   ),
    // );
  }

  final cookies = await SmartDialog.show<List<io.Cookie>>(
    tag: kDialogTag,
    builder: dialogBuilder,
    clickMaskDismiss: false,
    keepSingle: true,
    // useSystem: true,
  );

  // log cookies
  logger.d('****** cookies:\n${cookies?.map((e) => e.toString()).join('\n')}');

  if (cookies != null) {
    await Global.cookieJar
        .saveFromResponse(Uri.parse(NHConst.baseUrl), cookies);
    final rCookies =
        await Global.cookieJar.loadForRequest(Uri.parse(NHConst.baseUrl));
    logger.d('rCookies \n${rCookies.map((e) => e.toString()).join('\n')}');

    await onComplete?.call();
  }
}

final InAppWebViewGroupOptions inAppWebViewOptions = InAppWebViewGroupOptions(
  crossPlatform: InAppWebViewOptions(
    useShouldOverrideUrlLoading: true,
    mediaPlaybackRequiresUserGesture: false,
    // userAgent: GetPlatform.isIOS ? (Global.userAgent ?? NHConst.userAgent) : '',
  ),
  android: AndroidInAppWebViewOptions(
    useHybridComposition: true,
  ),
  ios: IOSInAppWebViewOptions(
    allowsInlineMediaPlayback: true,
  ),
);
