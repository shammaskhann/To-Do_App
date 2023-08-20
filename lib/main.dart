import 'package:flutter/material.dart';

import 'Screens/SplashScreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
      return MaterialApp(
        theme: ThemeData(
          textTheme: const TextTheme(
            labelLarge: TextStyle(color: Colors.amber, fontWeight: FontWeight.bold, fontSize: 45, fontFamily: 'Nike'),
            labelMedium: TextStyle(color: Colors.amber, fontWeight: FontWeight.bold, fontSize: 30, fontFamily: 'Nike'),
            headlineSmall: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 20, fontFamily: 'Nike'),
            titleSmall: TextStyle(color: Colors.black, fontWeight: FontWeight.normal , fontSize: 15 , fontFamily: 'Nike'),
          ),
        ),
     home: SplashScreen(),
   );
  }
}
