import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get_it/get_it.dart';

class InitTask {
  static Future initServices() async {
    // init device orientation
    // init firebase
    // init local storage services
    // init logger
    // init app config
    // init device details & package details
    // init utils
    // init language
    // init fcm utils (permission)
    WidgetsFlutterBinding.ensureInitialized();

    if (kIsWeb) {
      await Firebase.initializeApp(
          name: "portfolioDTM",
          options: const FirebaseOptions(
            apiKey: "AIzaSyBOCIicXN_BKvhCrCWhxGhujyAu5doSJFI",
            projectId: "portfoliodtm-c55b1",
            messagingSenderId: "1099410234557",
            appId: "1:1099410234557:web:ffc02cc02efede5fe1ebd4",
          ));
    } else {
      SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
      await Firebase.initializeApp();
    }
  }
}

final sl = GetIt.instance;
void setupLocator() {}
