// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers

import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:udemy_clone/screens/my_list.dart';

class MyCourses extends StatefulWidget {
  const MyCourses({Key? key}) : super(key: key);

  @override
  _MyCoursesState createState() => _MyCoursesState();
}

class _MyCoursesState extends State<MyCourses> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {
              Get.to(() => MyList());
            },
            icon: Icon(EvaIcons.shoppingCartOutline),
          ),
        ],
        backgroundColor: Colors.black,
        title: Text(
          'Your  Courses',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
      body: Container(
        child: Center(
          child: Text(
            'Add some courses',
            style: TextStyle(
              color: Colors.grey.shade600,
              fontSize: 24,
            ),
          ),
        ),
      ),
    );
  }
}
