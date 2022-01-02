// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers, sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:udemy_clone/screens/signing.dart/sign_in.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({Key? key}) : super(key: key);

  @override
  _LandingPageState createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            child: Center(
              child: Container(
                height: 380,
                width: double.infinity,
                child: Image.asset(
                  'images/bg_image.png',
                  fit: BoxFit.cover,
                  colorBlendMode: BlendMode.darken,
                  color: Colors.black54,
                ),
              ),
            ),
          ),
          SizedBox(height: 130),
          Text(
            '○  ○  ○  ○  ○ ',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.grey.shade600,
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.blue,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            MaterialButton(
              onPressed: () {},
              child: Text(
                'Browse',
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.grey.shade300,
                ),
              ),
            ),
            MaterialButton(
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  PageTransition(
                    child: SignIn(),
                    type: PageTransitionType.bottomToTop,
                  ),
                );
              },
              child: Text(
                'Sign-in',
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.grey.shade300,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
