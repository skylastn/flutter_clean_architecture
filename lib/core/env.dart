import 'dart:async';
import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:refreshed/refreshed.dart';
import '../app/global/local_controller.dart';
import '../utility/shared/notif.dart';
import 'app_component.dart';
import 'app_pages.dart';
import 'app_store_application.dart';
import 'dependency_injection.dart';
import 'firebase_traits.dart';

enum EnvType {
  development,
  production,
}

class Env {
  static late Env value;

  String get appName => '';

  String get appUsername => '';

  String get baseUrl => '';

  String get imageUrl => '';

  String get logo => '';

  String get articleUrl => '';

  String get socketUrl => '';

  String get websocket => '';

  String get callinkChat => '';

  String get vapidKey => '';

  String get tnc => '';

  Color get primarySwatch => Colors.teal;

  EnvType get environmentType => EnvType.development;

  // Database Config
  int get dbVersion => 1;

  String get dbName => '';

  Env() {
    value = this;
    _init();
  }

  void _init() async {
    if (GetPlatform.isWeb || Platform.isWindows) {
      initAllPackage();
      return;
    }
    runZonedGuarded<Future<void>>(
      () async {
        initAllPackage();
      },
      (error, stack) {
        if (GetPlatform.isWeb) {
          return;
        }
        // FirebaseCrashlytics.instance.recordError(error, stack);
      },
    );
  }

  initAllPackage() async {
    WidgetsFlutterBinding.ensureInitialized();
    Get.put(LocalController(), permanent: true);
    await Notif().initNotif();
    await FirebaseTraits().init();

    await DenpendencyInjection.init();
    if (!GetPlatform.isWeb) {
      /// Set status bar icon color
      SystemChrome.setSystemUIOverlayStyle(
        const SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
          statusBarIconBrightness: Brightness.dark,
          statusBarBrightness: Brightness.light,
        ),
      );
    }

    var application = AppStoreApplication();
    await application.onCreate();
    var initialRoute = AppPages.INITIAL;
    await initializeDateFormatting('id_ID', null);
    // await CapabilityProfile.ensureProfileLoaded(); //printer

    runApp(AppComponent(application, initialRoute));
  }
}
