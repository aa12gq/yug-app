import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'common/index.dart';
import 'common/services/config.dart';
import 'common/utils/storage.dart';

class Global {
  static Future<void> init() async {
    // plugin initialization
    WidgetsFlutterBinding.ensureInitialized();

    // initialize storage
    await Storage().init();

    // initialize queue
    await Future.wait([
      // configuration service
      Get.putAsync<ConfigService>(() async => await ConfigService().init()),
    ]).whenComplete(() {});
  }
}
