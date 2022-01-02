// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, avoid_unnecessary_containers, sized_box_for_whitespace

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:udemy_clone/screens/home_screen.dart';
import 'package:udemy_clone/screens/landing_page.dart';
import 'package:udemy_clone/services/storage.dart';

String? finalName;
String? finalEmail;

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final SecureStorage _secureStorage = SecureStorage();

  @override
  void initState() {
    _secureStorage.readSecureData('email').then((value) {
      finalEmail = value;
    });
    _secureStorage.readSecureData('name').then((value) {
      finalName = value;
    });
    super.initState();
    Timer(
      Duration(seconds: 3),
      () => Navigator.pushReplacement(
        context,
        PageTransition(
          child: finalEmail == null ? LandingPage() : HomeScreen(),
          type: PageTransitionType.rightToLeftWithFade,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: 30),
              height: 300,
              child: Image.asset('images/ulogo.png'),
            ),
            Padding(
              padding: EdgeInsets.only(top: 100.0),
              child: CircularProgressIndicator(
                backgroundColor: Colors.black,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
