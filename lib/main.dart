import 'package:flutter/material.dart';
// import 'package:urbabhub_test/SignIn/Register/Verify.dart';
import 'package:urbanhub/Splash/splash.dart';

import 'SignIn/Register/Register.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.indigo),
        useMaterial3: true,
      ),
      home: SplashScreen(),
      // home:register()
    );
  }
}
