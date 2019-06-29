class Constants{

  ///SharedPreferences keys
  ///
  ///whether app is first run
  static final String keyIsFirstRun = "isFirstRun";
  static final String keyIsAutoSync = "isAutoSync";


  ///navigator routes tag
  ///
  ///home page tag
  static final String homePageRoutesTag = "homePage";
  static final String swipeHomePageRoutesTag = "swipeHomePage";

  ///user guide page tag
  static final String userGuidePageRoutesTag = "userGuidePage";

  ///language list page
  static final String languageListPageRoutesTag = "languageListPage";

  ///Settings
  ///是否显示右上角debug标签，true-显示，false-隐藏
  static final bool isNeedShowDebugBanner = false;

  /// unit:s
  static final int defaultSplashPageDisplayTime = 3;

  static final bool isMainPageSupportSwipe = true;
}
