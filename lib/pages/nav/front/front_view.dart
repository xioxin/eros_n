import 'package:auto_route/auto_route.dart';
import 'package:eros_n/common/extension.dart';
import 'package:eros_n/component/models/gallery.dart';
import 'package:eros_n/component/widget/eros_cached_network_image.dart';
import 'package:eros_n/generated/l10n.dart';
import 'package:eros_n/pages/gallery/gallery_provider.dart';
import 'package:eros_n/pages/list_view/item/item_base.dart';
import 'package:eros_n/pages/list_view/list_view.dart';
import 'package:eros_n/pages/nav/index/index_provider.dart';
import 'package:eros_n/routes/routes.dart';
import 'package:eros_n/utils/get_utils/extensions/context_extensions.dart';
import 'package:eros_n/utils/get_utils/extensions/export.dart';
import 'package:eros_n/utils/logger.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:keframe/keframe.dart';
import 'package:rotated_corner_decoration/rotated_corner_decoration.dart';
import 'package:sliver_tools/sliver_tools.dart';

import 'front_provider.dart';

class FrontPage extends StatefulHookConsumerWidget {
  const FrontPage({super.key});

  @override
  ConsumerState<FrontPage> createState() => _FrontPageState();
}

class _FrontPageState extends ConsumerState<FrontPage>
    with AutomaticKeepAliveClientMixin {
  final ScrollController scrollController = ScrollController();
  ScrollDirection _lastScrollDirection = ScrollDirection.idle;
  double lastScrollOffset = 0;

  IndexNotifier get indexProviderNoti => ref.read(indexProvider.notifier);

  @override
  void initState() {
    super.initState();
    indexProviderNoti.addScrollController(scrollController);
    ref.read(frontProvider.notifier).loadData();
    scrollController.addListener(_scrollListener);
  }

  void _scrollListener() {
    const double threshold = 100;
    if (scrollController.position.userScrollDirection ==
        ScrollDirection.reverse) {
      if (_lastScrollDirection != ScrollDirection.reverse) {
        lastScrollOffset = scrollController.offset;
      }
      if (scrollController.offset - lastScrollOffset > threshold) {
        indexProviderNoti.hideNavigationBar();
      }
      _lastScrollDirection = ScrollDirection.reverse;
    }
    if (scrollController.position.userScrollDirection ==
        ScrollDirection.forward) {
      if (_lastScrollDirection != ScrollDirection.forward) {
        lastScrollOffset = scrollController.offset;
      }
      if (lastScrollOffset - scrollController.offset > threshold) {
        indexProviderNoti.showNavigationBar();
      }
      _lastScrollDirection = ScrollDirection.forward;
    }
  }

  @override
  Widget build(BuildContext context) {
    logger.v('FrontPage build');

    super.build(context);
    logger.v('${MediaQuery.of(context).padding.top}');
    logger.v('${context.width}');
    return Scaffold(
      body: RefreshIndicator(
        onRefresh: () => ref.read(frontProvider.notifier).reloadData(),
        edgeOffset: MediaQuery.of(context).padding.top + kToolbarHeight,
        child: SizeCacheWidget(
          child: CustomScrollView(
            controller: scrollController,
            cacheExtent: 500,
            slivers: [
              const SliverAppBar(
                floating: true,
                pinned: true,
                // scrolledUnderElevation: 0,
                bottom: PreferredSize(
                  preferredSize: Size.fromHeight(0),
                  child: SizedBox(height: 0),
                ),
                toolbarHeight: 0,
              ),
              MultiSliver(
                pushPinnedChildren: true,
                children: [
                  SliverPinnedHeader(
                    child: Container(
                      height: kToolbarHeight,
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      color: Theme.of(context).scaffoldBackgroundColor,
                      alignment: Alignment.centerLeft,
                      child: Text(
                        L10n.of(context).popular,
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                    ),
                  ),
                  const PopularListView(),
                ],
              ),
              MultiSliver(
                pushPinnedChildren: true,
                children: [
                  SliverPinnedHeader(
                    child: GestureDetector(
                      onTap: () {
                        scrollController.animateTo(0,
                            duration: const Duration(milliseconds: 300),
                            curve: Curves.ease);
                      },
                      child: Container(
                        height: kToolbarHeight,
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        color: Theme.of(context).scaffoldBackgroundColor,
                        alignment: Alignment.centerLeft,
                        child: Text(
                          L10n.of(context).newest,
                          style: Theme.of(context).textTheme.titleLarge,
                        ),
                      ),
                    ),
                  ),
                  const GalleryListView(),
                ],
              ),
              Consumer(builder: (context, ref, _) {
                final state = ref.watch(frontProvider);
                return EndIndicator(
                  loadStatus: state.status,
                );
              }),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    scrollController.dispose();
  }

  @override
  bool get wantKeepAlive => true;
}

class PopularListView extends ConsumerWidget {
  const PopularListView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final popularList = ref.watch(popularProvider);
    return MultiSliver(
      children: [
        SizedBox(
          height: 240,
          child: ListView.builder(
            padding: const EdgeInsets.all(8),
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              final gallery = popularList[index];
              final card = SizedBox(
                width: 160,
                child: Card(
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  child: Container(
                    foregroundDecoration: (gallery.languageCode == 'ja' ||
                            gallery.languageCode == null)
                        ? null
                        : RotatedCornerDecoration(
                            color: Theme.of(context)
                                .colorScheme
                                .primary
                                .withOpacity(0.8),
                            geometry:
                                const BadgeGeometry(width: 38, height: 28),
                            textSpan: TextSpan(
                              text: gallery.languageCode?.toUpperCase() ?? '',
                              style: const TextStyle(
                                  fontSize: 10, fontWeight: FontWeight.bold),
                            ),
                          ),
                    child: Stack(
                      alignment: Alignment.bottomCenter,
                      fit: StackFit.expand,
                      children: [
                        ShaderMask(
                          shaderCallback: (Rect bounds) {
                            return const LinearGradient(
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                                colors: [
                                  Colors.transparent,
                                  Colors.transparent,
                                  Colors.transparent,
                                  Colors.black87,
                                ]).createShader(
                              Rect.fromLTRB(0, 0, bounds.width, bounds.height),
                            );
                          },
                          blendMode: BlendMode.darken,
                          child: CoverImg(
                            imgUrl: gallery.thumbUrl,
                            fit: BoxFit.cover,
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.all(4),
                          alignment: Alignment.bottomCenter,
                          child: Text(
                            (gallery.title.englishTitle ?? '').prettyTitle,
                            style:
                                Theme.of(context).textTheme.bodyText2?.copyWith(
                                      color: Colors.white,
                                    ),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );

              return GestureDetector(
                onTap: () {
                  ref
                      .read(galleryProvider(gallery.gid).notifier)
                      .initFromGallery(gallery);
                  context.router.push(GalleryRoute(gid: gallery.gid));
                },
                child: card,
              );
            },
            itemCount: popularList.length,
          ),
        ),
      ],
    );
  }
}

class GalleryListView extends HookConsumerWidget {
  const GalleryListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    logger.v('GalleryListView build');
    final List<Gallery> galleryList = ref.watch(gallerysProvider);
    final state = ref.watch(frontProvider);

    if (state.isLoading) {
      return const SliverFillRemaining(
        child: Center(
          child: CircularProgressIndicator(),
        ),
      );
    }
    return GalleryWaterfallFlowView(
      gallerys: galleryList,
      lastComplete: () => ref.read(frontProvider.notifier).loadNextPage(),
      keepPosition: true,
      maxPage: state.maxPage,
    );
  }
}
