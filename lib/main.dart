import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'core/constant/color.dart';
import 'routes.dart';
import 'view/screen/splash/splash.dart';

void main() {
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
      home: const SplashView(),
      routes: routes,
    );
  }
}
