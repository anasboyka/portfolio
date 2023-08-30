import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
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
    await Firebase.initializeApp(
      name: "portfolioDTM",
        options: const FirebaseOptions(
      apiKey: "AIzaSyBOCIicXN_BKvhCrCWhxGhujyAu5doSJFI",
      projectId: "portfoliodtm-c55b1",
      messagingSenderId: "1099410234557",
      appId: "1:1099410234557:web:ffc02cc02efede5fe1ebd4",
    ));
    //setupLocator();
    // await Firebase.initializeApp();
  }

  // static List<SingleChildWidget> initProviderRoot() {
  //   return [
  //     ChangeNotifierProvider(
  //       create: (_) => Package(),
  //     ),
  //     ChangeNotifierProvider(
  //       create: (_) => Device(),
  //     ),
  //     ChangeNotifierProvider(
  //       create: (_) => TodoProvider(),
  //     )
  //   ];
  // }

  // static Future<List<SingleChildWidget>> initProviderCtx(
  //     BuildContext context) async {
  //   // ConnectivityStatus connectivityStatus = await ConnectivityStatus().init();
  //   // Screen screen = ScreenSetup.init(context);

  //   return [
  //     //ChangeNotifierProvider(create: (context) => connectivityStatus),
  //     // StreamProvider(
  //     //     create: (context) => InternetConnection().networkStatus,
  //     //     initialData: NetworkStatus())
  //   ];
  // }
}

final sl = GetIt.instance;
void setupLocator() {
  // sl.registerSingletonAsync<DirInfo>(() async => await FileSetup.setup());
  // sl.registerSingletonAsync<Package>(() async => await Package().init());
  // sl.registerSingletonAsync<Device>(() async => await Device().init());
  // sl.registerSingletonAsync<InternetConnection>(
  //     () async => await InternetConnection().init());
}
