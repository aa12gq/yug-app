import '../locale_keys.dart';

/// i18n en
Map<String, String> localeEn = {
  // common
  LocaleKeys.commonSearchInput: 'Enter keyword',
  LocaleKeys.commonBottomSave: 'Save',
  LocaleKeys.commonBottomRemove: 'Remove',
  LocaleKeys.commonBottomCancel: 'Cancel',
  LocaleKeys.commonBottomConfirm: 'Confirm',
  LocaleKeys.commonBottomApply: 'Apply',
  LocaleKeys.commonBottomBack: 'Back',
  LocaleKeys.commonSelectTips: 'Please select',
  LocaleKeys.commonMessageSuccess: '@method successfully',
  LocaleKeys.commonMessageIncorrect: '@method incorrect',

  // style
  LocaleKeys.stylesTitle: 'Sytles && Function',

  // network errors
  LocaleKeys.networkErrorTimeout: 'Request timeout',
  LocaleKeys.networkErrorCancelled: 'Request cancelled',
  LocaleKeys.networkErrorAborted: 'Request aborted',
  LocaleKeys.networkErrorUnknown: 'Unknown error',
  LocaleKeys.networkErrorInternal: 'Internal server error',

  // welcome 欢迎
  LocaleKeys.welcomeOneTitle: 'Share Your Moments',
  LocaleKeys.welcomeOneDesc:
      'Capture and share your wonderful moments in YuGuang',
  LocaleKeys.welcomeTwoTitle: 'Connect with Like-minded Friends',
  LocaleKeys.welcomeTwoDesc:
      'Join YuLe Island, make new friends through fun interactions',
  LocaleKeys.welcomeThreeTitle: 'Unlimited Creativity',
  LocaleKeys.welcomeThreeDesc:
      'Explore the creative workshop and let your ideas shine',
  LocaleKeys.welcomeSkip: 'Skip',
  LocaleKeys.welcomeNext: 'Next',
  LocaleKeys.welcomeStart: 'Start YuGuang Journey',
  // 登录、注册 - 通用
  LocaleKeys.loginForgotPassword: 'Forgot Password?',
  LocaleKeys.loginSignIn: 'Sign In',
  LocaleKeys.loginSignUp: 'Sign Up',
  LocaleKeys.loginOrText: '- OR -',

  // 注册 - new user
  LocaleKeys.registerTitle: 'Register',
  LocaleKeys.registerDesc: 'Sign up to continue',
  LocaleKeys.registerFormName: 'Username',
  LocaleKeys.registerFormEmail: 'Email',
  LocaleKeys.registerFormPhoneNumber: 'Phone Number',
  LocaleKeys.registerFormPassword: 'Password',
  LocaleKeys.registerFormVerifyCode: 'Verification Code',
  LocaleKeys.registerHaveAccount: 'Already have an account?',
  LocaleKeys.registerTypeUsername: 'Username Password',
  LocaleKeys.registerTypePhone: 'Phone Number',
  LocaleKeys.registerTypeEmail: 'Email',
  LocaleKeys.registerGetVerifyCode: 'Get Code',

  // 验证提示
  LocaleKeys.validatorRequired: 'The field is obligatory',
  LocaleKeys.validatorEmail: 'The field must be an email',
  LocaleKeys.validatorMin: 'Length cannot be less than @size',
  LocaleKeys.validatorMax: 'Length cannot be greater than @size',
  LocaleKeys.validatorPassword:
      'password must have between @min and @max digits',

  // 注册PIN - register pin
  LocaleKeys.registerPinTitle: 'Verification',
  LocaleKeys.registerPinDesc: 'we will send you a Pin to continue your account',
  LocaleKeys.registerPinFormTip: 'Pin',
  LocaleKeys.registerPinButton: 'Submit',

  // 登录 - back login
  LocaleKeys.loginBackTitle: 'Welcome login!',
  LocaleKeys.loginBackDesc: 'Sign in to continue',
  LocaleKeys.loginBackFieldEmail: 'Name',
  LocaleKeys.loginBackFieldPassword: 'Password',

  // APP 导航
  LocaleKeys.tabBarHome: 'Home',
  LocaleKeys.tabBarSocial: 'Chat',
  LocaleKeys.tabBarIsland: 'Island',
  LocaleKeys.tabBarMoments: 'Moments',
  LocaleKeys.tabBarProfile: 'Profile',
  LocaleKeys.tabBarNotes: 'Notes',
  LocaleKeys.tabBarAiChat: 'AI',
  LocaleKeys.tabBarAiChatLabel: 'YuChat',

  // Language Settings
  LocaleKeys.settingsLanguage: 'Language',
  LocaleKeys.settingsLanguageSelect: 'Select your preferred language',
  LocaleKeys.settingsLanguageZh: '简体中文',
  LocaleKeys.settingsLanguageZhSub: 'Chinese',
  LocaleKeys.settingsLanguageEn: 'English',
  LocaleKeys.settingsLanguageEnSub: 'English',
  LocaleKeys.settingsLanguageTip:
      'You can change the language at any time in settings',

  // My Profile
  LocaleKeys.myStatsFollowing: 'Following',
  LocaleKeys.myStatsFollowers: 'Followers',
  LocaleKeys.myStatsLikes: 'Likes',
  LocaleKeys.myStatsFavorites: 'Favorites',

  LocaleKeys.myMenuRecentActivity: 'Recent Activity',
  LocaleKeys.myMenuLanguage: 'Language',
  LocaleKeys.myMenuNotifications: 'Notifications',
  LocaleKeys.myMenuHelpFeedback: 'Help & Feedback',
  LocaleKeys.myMenuPrivacy: 'Privacy',

  // My Profile - More
  LocaleKeys.myTitle: 'My Space',
  LocaleKeys.myDefaultUsername: 'YuLe User',
  LocaleKeys.myDefaultSignature: 'Write a short bio here',
  LocaleKeys.myCreatorTag: 'Creator',
  LocaleKeys.myAchievementCreator: 'Top Creator',
  LocaleKeys.myAchievementFeatured: 'Featured Works',

  LocaleKeys.myStatsWorks: 'Works',
  LocaleKeys.myStatsPlays: 'Plays',
  LocaleKeys.myStatsSaves: 'Saves',
  LocaleKeys.myStatsComments: 'Comments',

  LocaleKeys.myQuickFavorites: 'Favorites',
  LocaleKeys.myQuickHistory: 'History',
  LocaleKeys.myQuickWorks: 'My Works',

  LocaleKeys.myAboutUs: 'About Us',
  LocaleKeys.myTerms: 'Terms of Service',
  LocaleKeys.myPrivacyPolicy: 'Privacy Policy',

  // Settings
  LocaleKeys.settingsTitle: 'Settings',
  LocaleKeys.settingsAccountSecurity: 'Account & Security',
  LocaleKeys.settingsNotificationCache: 'Notifications & Cache',
  LocaleKeys.settingsNotification: 'Notifications',
  LocaleKeys.settingsNotificationDesc: 'Manage app notifications',
  LocaleKeys.settingsClearCache: 'Clear Cache',
  LocaleKeys.settingsClearCacheDesc: 'Clear app cache data',
  LocaleKeys.settingsClearCacheTitle: 'Clear Cache',
  LocaleKeys.settingsClearCacheConfirm:
      'Are you sure to clear cache? Current size: ',
  LocaleKeys.settingsClearCacheSuccess: 'Cache cleared',
  LocaleKeys.settingsClearCacheFailed: 'Failed to clear cache',
  LocaleKeys.settingsLogout: 'Logout',
  LocaleKeys.settingsLogoutTitle: 'Logout',
  LocaleKeys.settingsLogoutConfirm: 'Are you sure to logout?',
  LocaleKeys.settingsLogoutFailed: 'Failed to logout',

  // Login
  LocaleKeys.loginSlogan: "Make life better",
  LocaleKeys.loginUsername: "Username",
  LocaleKeys.loginPassword: "Password",
  LocaleKeys.loginPhone: "Phone",
  LocaleKeys.loginEmail: "Email",
  LocaleKeys.loginCaptcha: "Verification Code",
  LocaleKeys.loginGetCaptcha: "Get Code",
  LocaleKeys.loginUsernameRequired: "Please enter username",
  LocaleKeys.loginUsernameLength: "Username must be 3-20 characters",
  LocaleKeys.loginPasswordRequired: "Please enter password",
  LocaleKeys.loginPasswordLength: "Password must be 6-18 characters",
  LocaleKeys.loginPhoneRequired: "Please enter phone number",
  LocaleKeys.loginPhoneInvalid: "Please enter valid phone number",
  LocaleKeys.loginEmailRequired: "Please enter email",
  LocaleKeys.loginEmailInvalid: "Please enter valid email",
  LocaleKeys.loginCaptchaRequired: "Please enter verification code",
  LocaleKeys.loginCaptchaLength: "Verification code must be 4-6 digits",
  LocaleKeys.loginBetaTag: "Beta",
  LocaleKeys.loginTypeUsernameValue: "username",
  LocaleKeys.loginTypePhoneValue: "phone",
  LocaleKeys.loginTypeEmailValue: "email",
  LocaleKeys.loginButton: "Sign In",
  LocaleKeys.loginOr: "or",
  LocaleKeys.loginOtherMethods: "Other Sign In Methods",
  LocaleKeys.loginNoAccount: "Don't have an account?",
  LocaleKeys.loginRegisterNow: "Register Now",
  LocaleKeys.loginTypeUsername: "Account",
  LocaleKeys.loginTypePhone: "Phone",
  LocaleKeys.loginTypeEmail: "Email",
  LocaleKeys.loginAgreementCheck: "I have read and agree to",
  LocaleKeys.loginAgreementPrefix: "",
  LocaleKeys.loginAgreementSuffix: "",
  LocaleKeys.loginAgreementAnd: "and",
  LocaleKeys.loginUserAgreement: "User Agreement",
  LocaleKeys.loginPrivacyPolicy: "Privacy Policy",
  LocaleKeys.loginAgreementButton: "Agree and Continue",
  LocaleKeys.loginDisagreeButton: "Not Now",

  // Agreement
  LocaleKeys.loginAgreementTitle: "Terms of Service & Privacy Policy",
  LocaleKeys.loginAgreementTip:
      "Please read and agree to the following agreements",
  LocaleKeys.loginAgreementRead: "I have read and agree to the",
  LocaleKeys.loginAgreeButton: "Agree",

  // Error Messages
  LocaleKeys.loginErrorCaptcha: "Invalid verification code",
  LocaleKeys.loginErrorCaptchaRequired: "Image verification code required",
  LocaleKeys.loginErrorContactRequired: "Please enter phone number or email",
  LocaleKeys.loginErrorGeneral: "Login failed",
  LocaleKeys.loginErrorTip: "Tips",
  LocaleKeys.loginSuccessVerifyCode: "Verification code sent",
};
