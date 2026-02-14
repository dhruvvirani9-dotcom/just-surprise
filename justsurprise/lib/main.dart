import 'dart:async';
import 'dart:io';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:justsurprise/res/assets/image_assets.dart';
import 'package:justsurprise/res/routes/routes.dart';
import 'package:justsurprise/res/routes/routes_name.dart';
import 'package:justsurprise/utils/GlobalVariable.dart';
import 'package:justsurprise/utils/http_override.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  await GetStorage.init();
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  HttpOverrides.global = MyHttpOverrides();
  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
  await FirebaseMessaging.instance.setForegroundNotificationPresentationOptions(
    alert: true,
    badge: true,
    sound: true
  );
  runApp(const MyApp());
}

@pragma('vm:entry-point')
Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  await Firebase.initializeApp();
  print('messageId ${message.messageId}');
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      navigatorKey: GlobalVariable.navState,
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(),
      getPages: AppRoutes.appRoutes(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => MyHomePageState();
}

class MyHomePageState extends State<MyHomePage> {

  static const String KEYLOGIN = "login";

  @override
  void initState() {
    super.initState();
    FirebaseMessaging.instance.getInitialMessage();
    whereTogo();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: SizedBox(
                width: Get.width,
                child: const Image(image: AssetImage(ImageAssets.splashScreen), fit: BoxFit.fill))
        )
    );
  }

  void whereTogo() async {
    var sharedpref = await SharedPreferences.getInstance();

    var isloggedIn = sharedpref.getBool(KEYLOGIN);

    Timer(const Duration(seconds: 3), () {
      if(isloggedIn!=null){
        if(isloggedIn){
          Get.offAndToNamed(RoutesName.homeScreen);
        }else{
          Get.offAndToNamed(RoutesName.onBoardingScreen);
        }
      }else{
        Get.offAndToNamed(RoutesName.onBoardingScreen);
      }
    });
  }
}
