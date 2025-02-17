class NHConst {
  static const String userAgent = 'ErosN';

  static const String accept =
      'text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3;q=0.9';

  static const String acceptLanguage =
      'zh-CN,zh;q=0.9,en;q=0.8,en-GB;q=0.7,en-US;q=0.6';

  static const String baseUrl = 'https://nhentai.net';
  static const String baseHost = 'nhentai.net';

  static const String loginUrl = 'https://nhentai.net/login/';
  static const String registerUrl = 'https://nhentai.net/register/';
  static const String infoUrl = 'https://nhentai.net/info/';

  // 瀑布流视图参数
  // static const double waterfallFlowCrossAxisSpacing = 4.0;
  // static const double waterfallFlowMainAxisSpacing = 4.0;
  // static const double waterfallFlowMaxCrossAxisExtent = 150.0;
  // static const double waterfallFlowMaxCrossAxisExtentTablet = 220.0;

  // 瀑布流视图参数 large
  static const double waterfallFlowLargeCrossAxisSpacing = 12.0;
  static const double waterfallFlowLargeMainAxisSpacing = 12.0;
  static const double waterfallFlowLargeMaxCrossAxisExtent = 190.0;

  // Grid视图参数
  static const double gridCrossAxisSpacing = 6.0;
  static const double gridMainAxisSpacing = 6.0;
  static const double gridMaxCrossAxisExtent = 150.0;
  static const double gridChildAspectRatio = 1 / 1.8;

  // 扩展名map
  static const Map<String, String> extMap = {
    'j': 'jpg',
    'p': 'png',
    'g': 'gif',
  };
}
