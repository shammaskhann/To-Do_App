import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../Screens/dashboard_screen.dart';

class SplashServices{
  void screenRoute(BuildContext context){
    Timer(
        const Duration(seconds: 4),
            () => Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) => const dashBoardScreen())));
  }
}