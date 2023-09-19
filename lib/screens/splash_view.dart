import 'package:flutter/material.dart';
import 'package:mynewproject/Assets/colors.dart';
import 'package:mynewproject/screens/home_view.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  double _opacity = 1.0; // Initial opacity for the splash screen

  @override
  void initState() {
    super.initState();
    _navigateToHome();
  }

  _navigateToHome() async {
    await Future.delayed(Duration(milliseconds: 1500), () {
      // Start the fade-out animation
      setState(() {
        _opacity = 0.0;
      });
    });

    // After the animation, navigate to the home page
    await Future.delayed(Duration(milliseconds: 500), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => HomePage()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: AnimatedOpacity(
          opacity: _opacity, // Use the animated opacity
          duration: Duration(milliseconds: 500), // Animation duration
          curve: Curves.easeOut, // Animation curve
          child: Container(
            width: double.infinity,
            height: double.infinity,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [MyColors.yellowL, MyColors.blueL],
              ),
            ),
            child: Center(
              child: Text(
                "Flutter First Project",
                style: TextStyle(
                  color: MyColors.black20,
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
