import 'package:get/get.dart';
import 'package:package_info_plus/package_info_plus.dart';

/// configuration service
class ConfigService extends GetxService {
  // this is a singleton
  static ConfigService get to => Get.find();

  PackageInfo? _platform;
  String get version => _platform?.version ?? '-';

  // initialize
  Future<ConfigService> init() async {
    await getPlatform();
    return this;
  }

  Future<void> getPlatform() async {
    _platform = await PackageInfo.fromPlatform();
  }
}
