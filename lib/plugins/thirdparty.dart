import 'dart:io';

import 'package:yug_app/common/utils/log.dart';
import 'package:yug_app/common/utils/store_data.dart';
import 'package:yug_app/res/strings.dart';
import 'aliyun_push.dart';

/// 在登录后或者权限确认后尝试初始化第三方服务
Future<void> tryInitThirdPartySDKN() async {
  bool isAgreedPrivacy =
      await StoreCache.getCache(StoreCache.keyPrivacyPolicyAgreed) ==
          Strings.privacyPolicyAgreedYes;
  if (isAgreedPrivacy) {
    try {
      if (Platform.isIOS || Platform.isAndroid) {
        await initAliyunPush();
      }
    } catch (e, s) {
      logDebug(e);
      logDebug(s);
    }
  }
}
