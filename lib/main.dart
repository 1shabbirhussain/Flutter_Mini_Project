import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:mynewproject/Firebase%20work/signup.dart';
import 'package:mynewproject/screens/bottom_navbar_view.dart';
import 'package:mynewproject/firebase_options.dart';
import 'package:mynewproject/screens/HomePageAll.dart';
import 'package:mynewproject/screens/cart_view.dart';
import 'package:mynewproject/screens/check_out.view.dart';
import 'package:mynewproject/screens/items_view.dart';
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
      home: SplashScreen(),
      // home: Home(),
      // home: NavbarView(),
      // home: CartView(),
      // home: CheckOut(),
      // home: ItemsView(),
      // home: HomePageAll(),
      // home:Categories2() ,
      // home: SignUpScreen(),
    );
  }
}
