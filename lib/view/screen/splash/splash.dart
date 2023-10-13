import 'dart:async';

import 'package:be3ly/view/screen/onboarding.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import '../../../core/constant/imgaeasset.dart';

class SplashView extends StatefulWidget {
  const SplashView({Key? key}) : super(key: key);

  @override
  _SplashViewState createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  Timer? _timer;

  _startDelay() {
    _timer = Timer(const Duration(seconds: 7), _goNext);
  }

  _goNext() {
    Navigator.of(context)
        .pushReplacement(MaterialPageRoute(builder: ((context) {
      return const OnBoarding();
    })));
  }

  @override
  void initState() {
    super.initState();
    _startDelay(); // to do first
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Center(
              child: Image(image: AssetImage(AppImageAsset.splashImage))),
          Center(
              child: Text(
            "Be3ly App",
            style: TextStyle(fontSize: 40.0, color: Colors.blueGrey[700]),
          )),
          Center(
              child: Text(
            "E-commerce App",
            style: TextStyle(fontSize: 30.0, color: Colors.blueGrey[600]),
          )),
          SpinKitThreeInOut(size: 25, color: Colors.blueGrey[800]),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _timer?.cancel(); //stop
    super.dispose();
  }
}
