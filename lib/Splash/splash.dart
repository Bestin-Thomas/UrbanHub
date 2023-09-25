import 'package:flutter/material.dart';
import 'package:urbanhub/Splash/page1.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    // Add any initialization tasks here, such as fetching data or checking authentication.

    // Example: You can use Future.delayed to simulate a delay before navigating to the main screen.
    Future.delayed(Duration(seconds: 3), () {
      // Navigate to the main screen (e.g., HomeScreen).
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => page1()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
            height: 162.33,
            width: 190.64,
            child: Image.asset('assets/images/splash.png')), // Display your splash screen image.
      ),
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
