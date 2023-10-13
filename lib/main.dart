import 'package:be3ly/view/auth/register/view.dart';
import 'package:be3ly/web/auth/login.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'core/constant/color.dart';
import 'firebase_options.dart';
import 'routes.dart';
import 'view/nav_bar/view.dart';
import 'view/screen/splash/splash.dart';
import 'package:firebase_core/firebase_core.dart';

import 'web/dashboard.dart';

void main() async {
    WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Be3ly',
      theme: ThemeData(
        fontFamily: "PlayfairDisplay",
        textTheme: const TextTheme(
            headline1: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 22,
                color: AppColor.black),
            bodyText1: TextStyle(
                height: 2,
                color: AppColor.grey,
                fontWeight: FontWeight.bold,
                fontSize: 14)),
        primarySwatch: Colors.blue,
      ),
      home: PlatformDashboard(),// const RegisterView(),
      routes: routes,
    );
  }
}
class PlatformDashboard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Detect the platform and load the appropriate dashboard
    if (kIsWeb) {
      return LoginWebScreen();
    } else {
      return NavBarView();
    }
  }
}