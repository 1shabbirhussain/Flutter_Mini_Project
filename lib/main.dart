import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:mynewproject/firebase_options.dart';
import 'package:mynewproject/screens/home_view.dart';
import 'package:mynewproject/screens/bottom_navbar_view.dart';
import 'package:mynewproject/screens/signup.dart';
import 'package:mynewproject/screens/splash_view.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      // home: SplashScreen(),
      // home: GroceryHome(),
      home: NavbarView(),
      // home: SignUpScreen(),
    );
  }
}
