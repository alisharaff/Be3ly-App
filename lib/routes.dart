import 'package:be3ly/view/screen/onboarding.dart';
import 'package:flutter/material.dart';

import 'core/constant/routes.dart';

Map<String, Widget Function(BuildContext)> routes = {
  AppRoute.login: (context) => const OnBoarding()
};