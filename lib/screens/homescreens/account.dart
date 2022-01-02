// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, sized_box_for_whitespace, prefer_final_fields

import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:page_transition/page_transition.dart';
import 'package:udemy_clone/screens/landing_page.dart';
import 'package:udemy_clone/screens/my_list.dart';
import 'package:udemy_clone/screens/splash_sccreen.dart';
import 'package:udemy_clone/services/authentication.dart';
import 'package:udemy_clone/services/storage.dart';

class Accounts extends StatefulWidget {
  const Accounts({Key? key}) : super(key: key);

  @override
  _AccountsState createState() => _AccountsState();
}

class _AccountsState extends State<Accounts> {
  Authentication _authentication = Authentication();
  SecureStorage _secureStorage = SecureStorage();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {
              Get.to(MyList());
            },
            icon: Icon(EvaIcons.shoppingCartOutline),
          ),
        ],
        backgroundColor: Colors.black,
        title: Text(
          'Account',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 250,
              width: 400,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    finalName as String,
                    style: TextStyle(color: Colors.white, fontSize: 24),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 12),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(EvaIcons.google, color: Colors.white),
                        SizedBox(width: 10),
                        Text(
                          finalEmail as String,
                          style: TextStyle(color: Colors.grey, fontSize: 20),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 25),
                    child: MaterialButton(
                      onPressed: () {},
                      child: Text(
                        'Become an Instructor',
                        style: TextStyle(
                          color: Colors.lightBlueAccent,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 15.0),
              child: Text(
                'Video Preference',
                style: TextStyle(color: Colors.grey, fontSize: 14),
              ),
            ),
            ListTile(
              title: Text(
                'Downlaod Options',
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
              trailing: Icon(
                Icons.arrow_forward_ios_outlined,
                color: Colors.grey,
              ),
            ),
            ListTile(
              title: Text(
                'Video playback Options',
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
              trailing: Icon(
                Icons.arrow_forward_ios_outlined,
                color: Colors.grey,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 15.0),
              child: Text(
                'Account Settings',
                style: TextStyle(color: Colors.grey, fontSize: 14),
              ),
            ),
            ListTile(
              title: Text(
                'Account Security',
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
              trailing: Icon(
                Icons.arrow_forward_ios_outlined,
                color: Colors.grey,
              ),
            ),
            ListTile(
              title: Text(
                'Email Notification Preference',
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
              trailing: Icon(
                Icons.arrow_forward_ios_outlined,
                color: Colors.grey,
              ),
            ),
            ListTile(
              title: Text(
                'Learning Remainders',
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
              trailing: Icon(
                Icons.arrow_forward_ios_outlined,
                color: Colors.grey,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 15.0),
              child: Text(
                'Support',
                style: TextStyle(color: Colors.grey, fontSize: 14),
              ),
            ),
            ListTile(
              title: Text(
                'About Udemy',
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
              trailing: Icon(
                Icons.arrow_forward_ios_outlined,
                color: Colors.grey,
              ),
            ),
            ListTile(
              title: Text(
                'About Udemy for Business',
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
              trailing: Icon(
                Icons.arrow_forward_ios_outlined,
                color: Colors.grey,
              ),
            ),
            ListTile(
              title: Text(
                'FAQs',
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
              trailing: Icon(
                Icons.arrow_forward_ios_outlined,
                color: Colors.grey,
              ),
            ),
            ListTile(
              title: Text(
                'Share the Udemy app',
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
              trailing: Icon(
                Icons.arrow_forward_ios_outlined,
                color: Colors.grey,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 15.0),
              child: Text(
                'Diagnostic',
                style: TextStyle(color: Colors.grey, fontSize: 14),
              ),
            ),
            ListTile(
              title: Text(
                'Status',
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
              trailing: Icon(
                Icons.arrow_forward_ios_outlined,
                color: Colors.grey,
              ),
            ),
            Center(
              child: Padding(
                padding: EdgeInsets.only(top: 15, bottom: 10),
                child: MaterialButton(
                  onPressed: () async {
                    await _authentication.googleSignOut().whenComplete(() {
                      _secureStorage.deleteSecureData('email');
                    }).whenComplete(() {
                      Navigator.pushReplacement(
                        context,
                        PageTransition(
                          child: LandingPage(),
                          type: PageTransitionType.bottomToTop,
                        ),
                      );
                    });
                  },
                  child: Text(
                    'Sign out',
                    style: TextStyle(
                      color: Colors.lightBlueAccent,
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
