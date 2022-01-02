// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, avoid_unnecessary_containers, sized_box_for_whitespace, prefer_typing_uninitialized_variables

import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:udemy_clone/screens/my_list.dart';
import 'package:udemy_clone/services/data_controller.dart';

class WishList extends StatefulWidget {
  const WishList({Key? key}) : super(key: key);

  @override
  _WishListState createState() => _WishListState();
}

class _WishListState extends State<WishList> {
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
          'Wishlist',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 300,
                width: 400,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    CircleAvatar(
                      child: Icon(EvaIcons.shakeOutline, color: Colors.white),
                      radius: 50,
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 20),
                      child: Text(
                        'Want to save something for later',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 23,
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 15),
                      child: Text(
                        'Your wishlist should go here',
                        style: TextStyle(
                          color: Colors.grey.shade800,
                          fontSize: 19,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Text(
                'Browse Categories',
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
              ListTile(
                title: Text(
                  'Finance accounting',
                  style: TextStyle(color: Colors.grey.shade600, fontSize: 16),
                ),
                leading: Icon(
                  EvaIcons.browserOutline,
                  color: Colors.grey.shade600,
                ),
              ),
              ListTile(
                title: Text(
                  'Development',
                  style: TextStyle(color: Colors.grey.shade600, fontSize: 16),
                ),
                leading: Icon(
                  Icons.tv,
                  color: Colors.grey.shade600,
                ),
              ),
              ListTile(
                title: Text(
                  'Business',
                  style: TextStyle(color: Colors.grey.shade600, fontSize: 16),
                ),
                leading: Icon(
                  Icons.add_chart_outlined,
                  color: Colors.grey.shade600,
                ),
              ),
              ListTile(
                title: Text(
                  'IT & Software',
                  style: TextStyle(color: Colors.grey.shade600, fontSize: 16),
                ),
                leading: Icon(
                  Icons.laptop_mac_outlined,
                  color: Colors.grey.shade600,
                ),
              ),
              ListTile(
                title: Text(
                  'Office Productivity',
                  style: TextStyle(color: Colors.grey.shade600, fontSize: 16),
                ),
                leading: Icon(
                  EvaIcons.listOutline,
                  color: Colors.grey.shade600,
                ),
              ),
              ListTile(
                title: Text(
                  'Personal Development',
                  style: TextStyle(color: Colors.grey.shade600, fontSize: 16),
                ),
                leading: Icon(
                  Icons.ad_units_outlined,
                  color: Colors.grey.shade600,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
