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
  LocaleKeys.loginAgreeButton: "同意",

  // 协议内容
  LocaleKeys.loginUserAgreementContent: """
欢迎使用语光！

本用户协议（以下简称"本协议"）是您与语光之间就使用语光服务所订立的协议。

1. 服务内容
语光为用户提供社交平台服务，包括但不限于：
- 内容创作与分享
- 社交互动
- 创意探索
- 知识交流

2. 用户行为规范
2.1 用户在使用语光服务时应遵守中华人民共和国相关法律法规。
2.2 用户不得发布违法、违规或侵犯他人权益的内容。
2.3 用户应尊重他人的知识产权。

3. 账号安全
3.1 用户应妥善保管账号密码，因账号密码保管不当造成的损失由用户自行承担。
3.2 如发现账号被他人非法使用，应立即通知语光。

4. 服务变更、中断或终止
4.1 语光保留随时修改或中断服务的权利。
4.2 用户违反本协议规定时，语光有权终止提供服务。

5. 其他
5.1 语光保留对本协议的解释权。
5.2 本协议的修改会在应用内公布。
""",

  LocaleKeys.loginPrivacyPolicyContent: """
语光隐私政策

我们重视您的隐私，本政策说明我们如何收集、使用和保护您的个人信息。

1. 信息收集
我们收集的信息包括：
- 注册信息（用户名、手机号、邮箱等）
- 使用记录
- 设备信息
- 位置信息（如果您授权）

2. 信息使用
我们使用收集的信息用于：
- 提供和改进服务
- 个性化用户体验
- 安全防护
- 向您发送服务相关通知

3. 信息保护
3.1 我们采用业界标准的安全技术保护您的信息。
3.2 我们不会将您的信息用于本政策未载明的其他用途。
3.3 未经您同意，我们不会向第三方分享您的个人信息。

4. 您的权利
4.1 您可以查看、修改您的个人信息。
4.2 您可以删除您的账号。
4.3 您可以管理您的隐私设置。

5. 隐私政策更新
我们可能适时修改本隐私政策，并在应用内发布更新版本。

6. 联系我们
如您对本隐私政策有任何疑问，请通过应用内的"帮助与反馈"与我们联系。
""",

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

  LocaleKeys.loginUsernameHint: "请输入您的用户名",
  LocaleKeys.loginPasswordHint: "请输入您的密码",
  LocaleKeys.loginPhoneHint: "请输入您的手机号",
  LocaleKeys.loginEmailHint: "请输入您的邮箱",
  LocaleKeys.loginCaptchaHint: "请输入验证码",
};
