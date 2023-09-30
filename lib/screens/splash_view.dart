import 'package:flutter/material.dart';
import 'package:mynewproject/Assets/colors.dart';
import 'package:mynewproject/screens/get_started_view.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  double _scale = 1.0;
  double _opacity = 1.0;

  @override
  void initState() {
    super.initState();
    _startAnimation();
  }

  _startAnimation() async {
    await Future.delayed(Duration(milliseconds: 1000), () {
      setState(() {
        _opacity = 0.0;
        _scale = 1.5;
      });
    });

    await Future.delayed(Duration(milliseconds: 500), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => GetStartedView()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [MyColors.blueD, MyColors.blueL],
          ),
        ),
        child: Center(
          child: AnimatedOpacity(
            opacity: _opacity,
            duration: Duration(milliseconds: 500),
            curve: Curves.easeOut,
            child: Transform.scale(
              scale: _scale,
              child: Text(
                "Flutter First Project",
                style: TextStyle(
                  color: MyColors.black20,
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
