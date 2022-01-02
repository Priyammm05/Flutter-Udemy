// ignore_for_file: prefer_final_fields, prefer_const_constructors, deprecated_member_use

import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:page_transition/page_transition.dart';
import 'package:udemy_clone/screens/signing.dart/sign_in.dart';
import 'package:udemy_clone/services/authentication.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
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
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsets.only(bottom: 200),
                child: Text(
                  'Sign-up',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(bottom: 15),
                child: FlatButton.icon(
                  color: Colors.white,
                  onPressed: () async {
                    await _authentication.googleSignIn();
                  },
                  icon: Icon(EvaIcons.google),
                  label: Text('Sign-up with Google'),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(bottom: 15),
                child: FlatButton.icon(
                  color: Colors.white,
                  onPressed: () {},
                  icon: Icon(EvaIcons.facebook),
                  label: Text('Sign-up with Facebook'),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(bottom: 15),
                child: FlatButton.icon(
                  color: Colors.white,
                  onPressed: () {},
                  icon: Icon(FontAwesomeIcons.apple),
                  label: Text('Sign-up with Apple'),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 90),
                child: Row(
                  children: [
                    Text(
                      'Already have an account?',
                      style: TextStyle(color: Colors.white),
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
                        'Log-in',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
