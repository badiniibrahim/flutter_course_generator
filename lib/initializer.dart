import 'package:course_generator/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';

class Initializer {
  static Future<void> init() async {
    try {
      WidgetsFlutterBinding.ensureInitialized();
      await _initFirebase();
      await _initStorage();
      await _initEnvironment();
      await intMobileAds();
      await setPreferredOrientations();
    } catch (err) {
      rethrow;
    }
  }

  static Future<void> _initFirebase() async {
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
  }

  static Future<void> _initStorage() async {
    /* await GetStorage.init(StorageContainer.AppData.name);
    Get.put(StorageService());
    Get.put(AuthService());*/
  }

  static Future<void> _initEnvironment() async {
    //await dotenv.load(fileName: Environment.fileName);
  }

  static Future<void> intMobileAds() async {
    /*final initAdFuture = MobileAds.instance.initialize();
    Get.put(AdMobService(initAdFuture));*/
  }

  static Future<void> setPreferredOrientations() {
    return SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
      DeviceOrientation.landscapeRight,
      DeviceOrientation.landscapeLeft,
    ]);
  }
}
