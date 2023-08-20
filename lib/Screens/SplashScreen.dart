import 'dart:async';

import 'package:flutter/material.dart';

import '../Services/splash_services.dart';
class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  bool _visible = true;
  void initState() {
    super.initState();
    fadeTime();
    SplashServices().screenRoute(context);
  }

  void fadeTime() {
    Timer(
        const Duration(seconds: 1),
            () => setState(() {
          _visible = !_visible;
        }));
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnimatedOpacity(
        opacity: _visible ? 1.0 : 0,
        duration: const Duration(seconds: 3),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset("assets/images/spalsh.png"),
              Text("To Do", style: Theme.of(context).textTheme.labelLarge),
              Text("App", style: Theme.of(context).textTheme.labelMedium),
            ],
          )
        ),
      ),
          backgroundColor: Colors.grey.shade900,
    );
  }
}


