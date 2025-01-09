import '../locale_keys.dart';

/// i18n zh
Map<String, String> localeZh = {
  // common
  LocaleKeys.commonSearchInput: '输入关键字',
  LocaleKeys.commonBottomSave: '保存',
  LocaleKeys.commonBottomRemove: '删除',
  LocaleKeys.commonBottomCancel: '取消',
  LocaleKeys.commonBottomConfirm: '确认',
  LocaleKeys.commonBottomApply: '应用',
  LocaleKeys.commonBottomBack: '返回',
  LocaleKeys.commonSelectTips: '请选择',
  LocaleKeys.commonMessageSuccess: '@method 成功',
  LocaleKeys.commonMessageIncorrect: '@method 不正确',

  // style
  LocaleKeys.stylesTitle: '样式 && 功能 && 调试',

  // network errors
  LocaleKeys.networkErrorTimeout: '请求超时',
  LocaleKeys.networkErrorCancelled: '请求已取消',
  LocaleKeys.networkErrorAborted: '请求被终止',
  LocaleKeys.networkErrorUnknown: '未知错误',
  LocaleKeys.networkErrorInternal: '服务器内部错误',

  // welcome 欢迎
  LocaleKeys.welcomeOneTitle: '随时分享生活点滴',
  LocaleKeys.welcomeOneDesc: '在语光，记录并分享你的每一个精彩瞬间',
  LocaleKeys.welcomeTwoTitle: '发现志同道合的朋友',
  LocaleKeys.welcomeTwoDesc: '加入语乐岛，在有趣的互动中结识新朋友',
  LocaleKeys.welcomeThreeTitle: '创意无限 精彩无限',
  LocaleKeys.welcomeThreeDesc: '探索创意工作坊，让你的想法绽放光彩',
  LocaleKeys.welcomeSkip: '跳过',
  LocaleKeys.welcomeNext: '下一页',
  LocaleKeys.welcomeStart: '开启语光之旅',

  // 登录、注册 - 通用
  LocaleKeys.loginForgotPassword: '忘记密码?',
  LocaleKeys.loginSignIn: '登 陆',
  LocaleKeys.loginSignUp: '注 册',
  LocaleKeys.loginOrText: '- 或者 -',

  // 注册 - register user
  LocaleKeys.registerTitle: '欢迎',
  LocaleKeys.registerDesc: '注册新账号',
  LocaleKeys.registerFormName: '用户名',
  LocaleKeys.registerFormEmail: '邮箱',
  LocaleKeys.registerFormPhoneNumber: '手机号',
  LocaleKeys.registerFormPassword: '密码',
  LocaleKeys.registerFormVerifyCode: '验证码',
  LocaleKeys.registerHaveAccount: '已有账号?',
  LocaleKeys.registerTypeUsername: '用户名密码',
  LocaleKeys.registerTypePhone: '手机号',
  LocaleKeys.registerTypeEmail: '邮箱',
  LocaleKeys.registerGetVerifyCode: '获取验证码',

  // 验证提示
  LocaleKeys.validatorRequired: '字段不能为空',
  LocaleKeys.validatorEmail: '请输入 email 格式',
  LocaleKeys.validatorMin: '长度不能小于 @size',
  LocaleKeys.validatorMax: '长度不能大于 @size',
  LocaleKeys.validatorPassword: '密码长度必须 大于 @min 小于 @max',

  // 注册PIN - register pin
  LocaleKeys.registerPinTitle: '验证',
  LocaleKeys.registerPinDesc: '我们将向您发送PIN码以继续您的帐户',
  LocaleKeys.registerPinFormTip: 'Pin',
  LocaleKeys.registerPinButton: '提交',

  // 登录 - back login
  LocaleKeys.loginBackTitle: '欢迎登陆!',
  LocaleKeys.loginBackDesc: '登陆后继续',
  LocaleKeys.loginBackFieldEmail: '账号',
  LocaleKeys.loginBackFieldPassword: '登陆密码',

  // APP 导航
  LocaleKeys.tabBarHome: '首页',
  LocaleKeys.tabBarSocial: '聊天',
  LocaleKeys.tabBarIsland: '语乐岛',
  LocaleKeys.tabBarMoments: '动态',
  LocaleKeys.tabBarProfile: '我的',
  LocaleKeys.tabBarNotes: '随心记',
  LocaleKeys.tabBarAiChat: '语',
  LocaleKeys.tabBarAiChatLabel: '小语',

  // 语言设置
  LocaleKeys.settingsLanguage: '语言设置',
  LocaleKeys.settingsLanguageSelect: '选择您的首选语言',
  LocaleKeys.settingsLanguageZh: '简体中文',
  LocaleKeys.settingsLanguageZhSub: 'Chinese',
  LocaleKeys.settingsLanguageEn: 'English',
  LocaleKeys.settingsLanguageEnSub: '英语',
  LocaleKeys.settingsLanguageTip: '您可以随时在设置中更改语言',

  // 我的页面
  LocaleKeys.myStatsFollowing: '关注',
  LocaleKeys.myStatsFollowers: '粉丝',
  LocaleKeys.myStatsLikes: '获赞',
  LocaleKeys.myStatsFavorites: '收藏',

  LocaleKeys.myMenuRecentActivity: '最近活动',
  LocaleKeys.myMenuLanguage: '语言设置',
  LocaleKeys.myMenuNotifications: '消息通知',
  LocaleKeys.myMenuHelpFeedback: '帮助与反馈',
  LocaleKeys.myMenuPrivacy: '隐私设置',

  // 我的页面 - 更多
  LocaleKeys.myTitle: '我的空间',
  LocaleKeys.myDefaultUsername: '语乐用户',
  LocaleKeys.myDefaultSignature: '在这里写一句简短的个性签名',
  LocaleKeys.myCreatorTag: '创作者',
  LocaleKeys.myAchievementCreator: '优秀创作者',
  LocaleKeys.myAchievementFeatured: '作品精选',

  LocaleKeys.myStatsWorks: '作品数',
  LocaleKeys.myStatsPlays: '总播放',
  LocaleKeys.myStatsSaves: '总收藏',
  LocaleKeys.myStatsComments: '总评论',

  LocaleKeys.myQuickFavorites: '我的收藏',
  LocaleKeys.myQuickHistory: '浏览历史',
  LocaleKeys.myQuickWorks: '我的作品',

  LocaleKeys.myAboutUs: '关于我们',
  LocaleKeys.myTerms: '用户协议',
  LocaleKeys.myPrivacyPolicy: '隐私政策',

  // 设置页面
  LocaleKeys.settingsTitle: '设置',
  LocaleKeys.settingsAccountSecurity: '账号与安全',
  LocaleKeys.settingsNotificationCache: '通知与缓存',
  LocaleKeys.settingsNotification: '通知设置',
  LocaleKeys.settingsNotificationDesc: '管理应用通知',
  LocaleKeys.settingsClearCache: '清除缓存',
  LocaleKeys.settingsClearCacheDesc: '清除应用缓存数据',
  LocaleKeys.settingsClearCacheTitle: '清除缓存',
  LocaleKeys.settingsClearCacheConfirm: '确定要清除缓存吗？当前缓存大小：',
  LocaleKeys.settingsClearCacheSuccess: '清除成功',
  LocaleKeys.settingsClearCacheFailed: '清除失败',
  LocaleKeys.settingsLogout: '退出登录',
  LocaleKeys.settingsLogoutTitle: '退出登录',
  LocaleKeys.settingsLogoutConfirm: '确定要退出登录吗？',
  LocaleKeys.settingsLogoutFailed: '退出失败',

  // 登录
  LocaleKeys.loginSlogan: "让生活更美好",
  LocaleKeys.loginUsername: "用户名",
  LocaleKeys.loginPassword: "密码",
  LocaleKeys.loginPhone: "手机号",
  LocaleKeys.loginEmail: "邮箱",
  LocaleKeys.loginCaptcha: "验证码",
  LocaleKeys.loginGetCaptcha: "获取验证码",
  LocaleKeys.loginUsernameRequired: "请输入用户名",
  LocaleKeys.loginUsernameLength: "用户名长度为3-20位",
  LocaleKeys.loginPasswordRequired: "请输入密码",
  LocaleKeys.loginPasswordLength: "密码长度为6-18位",
  LocaleKeys.loginPhoneRequired: "请输入手机号",
  LocaleKeys.loginPhoneInvalid: "请输入正确的手机号",
  LocaleKeys.loginEmailRequired: "请输入邮箱",
  LocaleKeys.loginEmailInvalid: "请输入正确的邮箱",
  LocaleKeys.loginCaptchaRequired: "请输入验证码",
  LocaleKeys.loginCaptchaLength: "验证码长度为4-6位",
  LocaleKeys.loginBetaTag: "测试版",
  LocaleKeys.loginTypeUsernameValue: "username",
  LocaleKeys.loginTypePhoneValue: "phone",
  LocaleKeys.loginTypeEmailValue: "email",
  LocaleKeys.loginButton: "登录",
  LocaleKeys.loginOr: "或",
  LocaleKeys.loginOtherMethods: "其他登录方式",
  LocaleKeys.loginNoAccount: "还没有账号？",
  LocaleKeys.loginRegisterNow: "立即注册",
  LocaleKeys.loginTypeUsername: "账号",
  LocaleKeys.loginTypePhone: "手机号",
  LocaleKeys.loginTypeEmail: "邮箱",
  LocaleKeys.loginAgreementCheck: "我已阅读并同意",
  LocaleKeys.loginAgreementPrefix: "《",
  LocaleKeys.loginAgreementSuffix: "》",
  LocaleKeys.loginAgreementAnd: "和",
  LocaleKeys.loginUserAgreement: "用户协议",
  LocaleKeys.loginPrivacyPolicy: "隐私政策",
  LocaleKeys.loginAgreementButton: "同意并继续",
  LocaleKeys.loginDisagreeButton: "暂不使用",

  // 协议相关
  LocaleKeys.loginAgreementTitle: "服务协议和隐私政策",
  LocaleKeys.loginAgreementTip: "请阅读并同意以下协议",
  LocaleKeys.loginAgreementRead: "我已阅读并同意",

  // 错误提示
  LocaleKeys.loginErrorCaptcha: "验证码错误",
  LocaleKeys.loginErrorCaptchaRequired: "需要输入图片验证码",
  LocaleKeys.loginErrorContactRequired: "请输入手机号或邮箱",
  LocaleKeys.loginErrorGeneral: "登录失败",
  LocaleKeys.loginErrorTip: "提示",
  LocaleKeys.loginSuccessVerifyCode: "验证码已发送",

  // 关于页面
  LocaleKeys.aboutTitle: "关于语光",
  LocaleKeys.appName: "语光",
  LocaleKeys.appSlogan: "让生活更美好",
  LocaleKeys.appDescription:
      "语光是一个充满创意和温暖的社交平台，致力于为用户提供一个分享生活、交流想法、发现美好的空间。在这里，每个人都可以找到属于自己的精神家园。",
  LocaleKeys.appFeatures:
      "创意无限：在语乐岛探索和创作\\n知识分享：与志同道合的朋友交流\\n情感互动：在温暖的社区中成长\\n智能助手：AI助你更好地表达\\n隐私保护：安全可靠的数据加密",
};
