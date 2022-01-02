// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, avoid_unnecessary_containers, deprecated_member_use, prefer_final_fields

import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:page_transition/page_transition.dart';
import 'package:udemy_clone/screens/home_screen.dart';
import 'package:udemy_clone/screens/signing.dart/sign_up.dart';
import 'package:udemy_clone/services/authentication.dart';

class SignIn extends StatefulWidget {
  const SignIn({Key? key}) : super(key: key);

  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  Authentication _authentication = Authentication();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/landing_image.jpg'),
            fit: BoxFit.fitHeight,
            colorFilter: ColorFilter.mode(
              Colors.black54,
              BlendMode.darken,
            ),
          ),
        ),
        child: Center(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 45),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsets.only(bottom: 20),
                  child: Text(
                    'Sign-in',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Container(
                  width: double.infinity,
                  padding: EdgeInsets.only(bottom: 0),
                  child: FlatButton.icon(
                    color: Colors.white,
                    onPressed: () {},
                    icon: Icon(EvaIcons.email),
                    label: Text('Sign-in with Email'),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 25),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        width: 125,
                        child: Divider(color: Colors.white),
                      ),
                      Text(
                        'or',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                        ),
                      ),
                      SizedBox(
                        width: 125,
                        child: Divider(color: Colors.white),
                      ),
                    ],
                  ),
                ),
                Container(
                  width: double.infinity,
                  padding: EdgeInsets.only(bottom: 15, top: 100),
                  child: FlatButton.icon(
                    color: Colors.white,
                    onPressed: () async {
                      await _authentication.googleSignIn().whenComplete(() {
                        Navigator.pushReplacement(
                          context,
                          PageTransition(
                            child: HomeScreen(),
                            type: PageTransitionType.rightToLeftWithFade,
                          ),
                        );
                      });
                    },
                    icon: Icon(EvaIcons.google),
                    label: Text('Sign-in with Google'),
                  ),
                ),
                Container(
                  width: double.infinity,
                  padding: EdgeInsets.only(bottom: 15),
                  child: FlatButton.icon(
                    color: Colors.white,
                    onPressed: () {},
                    icon: Icon(EvaIcons.facebook),
                    label: Text('Sign-in with Facebook'),
                  ),
                ),
                Container(
                  width: double.infinity,
                  padding: EdgeInsets.only(bottom: 15),
                  child: FlatButton.icon(
                    color: Colors.white,
                    onPressed: () {},
                    icon: Icon(FontAwesomeIcons.apple),
                    label: Text('Sign-in with Apple'),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.only(left: 20),
                  child: Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'New here?',
                          style: TextStyle(color: Colors.white),
                        ),
                        MaterialButton(
                          onPressed: () {
                            Navigator.pushReplacement(
                              context,
                              PageTransition(
                                child: SignUp(),
                                type: PageTransitionType.bottomToTop,
                              ),
                            );
                          },
                          child: Text(
                            'Create an account',
                            textAlign: TextAlign.center,
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
