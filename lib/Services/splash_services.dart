import 'dart:async';
import 'package:flutter/material.dart';
import 'package:practise_app_3/Screens/Home/home_screen.dart';
class SplashServices{
  void screenRoute(BuildContext context){
    Timer(
        const Duration(seconds: 4),
            () => Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) => homescreen())));
  }
}