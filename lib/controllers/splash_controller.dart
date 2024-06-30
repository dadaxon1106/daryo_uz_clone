import 'dart:async';

import 'package:daryo_uz_clone/screens/home_view/main_screen.dart';
import 'package:flutter/material.dart';

class SplashController {
  static init(BuildContext context) {
    Timer(const Duration(seconds: 3), () {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => const HomeView()));
    });
  }
}
