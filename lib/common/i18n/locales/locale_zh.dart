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
  LocaleKeys.settingsAccountSecurityTitle: '账号安全',
  LocaleKeys.settingsAccountSecurityDesc: '密码修改、手机绑定',
  LocaleKeys.settingsPrivacy: '隐私设置',
  LocaleKeys.settingsPrivacyDesc: '个人信息保护',

  LocaleKeys.settingsNotificationCache: '通知与缓存',
  LocaleKeys.settingsNotification: '通知设置',
  LocaleKeys.settingsNotificationDesc: '消息提醒、声音设置',
  LocaleKeys.settingsClearCache: '清除缓存',
  LocaleKeys.settingsClearCacheDesc: '释放存储空间',

  LocaleKeys.settingsLogout: '退出登录',
};
