// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, sized_box_for_whitespace, avoid_unnecessary_containers

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:udemy_clone/screens/my_list.dart';
import 'package:udemy_clone/services/payment.dart';

class DetailedScreen extends StatefulWidget {
  const DetailedScreen({Key? key}) : super(key: key);

  @override
  _DetailedScreenState createState() => _DetailedScreenState();
}

class _DetailedScreenState extends State<DetailedScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text(
          'My List',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.ios_share, color: Colors.white),
          ),
          IconButton(
            onPressed: () {
              Get.to(() => MyList());
            },
            icon: Icon(EvaIcons.shoppingCartOutline, color: Colors.white),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                Get.arguments['title'],
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 15.0),
                child: Text(
                  Get.arguments['description'],
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 15,
                    // fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 15.0),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          padding:
                              EdgeInsets.symmetric(vertical: 6, horizontal: 8),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            border: Border.all(color: Colors.white),
                          ),
                          child: Text(
                            '☆ ${Get.arguments['ratings']} ',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Container(
                          padding:
                              EdgeInsets.symmetric(vertical: 6, horizontal: 10),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            border: Border.all(color: Colors.white),
                          ),
                          child: Text(
                            ('☆ ${Get.arguments['enrolled']} Enrolled '),
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Container(
                          padding:
                              EdgeInsets.symmetric(vertical: 6, horizontal: 10),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            border: Border.all(color: Colors.white),
                          ),
                          child: Text(
                            '☆ ${Get.arguments['hours']} total hours ',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 9),
                    Container(
                      width: double.infinity,
                      padding:
                          EdgeInsets.symmetric(vertical: 6, horizontal: 10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(color: Colors.white),
                      ),
                      child: Center(
                        child: Text(
                          ('☆ Created by ${Get.arguments['author']} '),
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 9),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          padding:
                              EdgeInsets.symmetric(vertical: 6, horizontal: 10),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            border: Border.all(color: Colors.white),
                          ),
                          child: Text(
                            '☆ ${Get.arguments['languages']}',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Container(
                          padding:
                              EdgeInsets.symmetric(vertical: 6, horizontal: 10),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            border: Border.all(color: Colors.white),
                          ),
                          child: Text(
                            '☆ Updated at ${Get.arguments['update']}',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              GestureDetector(
                child: Padding(
                  padding: EdgeInsets.only(top: 25),
                  child: Container(
                    height: 300,
                    width: 400,
                    child: Center(
                      child: Stack(
                        children: [
                          Container(
                            height: 200,
                            width: 400,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: NetworkImage(Get.arguments['image']),
                                fit: BoxFit.cover,
                                colorFilter: ColorFilter.mode(
                                    Colors.black45, BlendMode.darken),
                              ),
                            ),
                          ),
                          Positioned(
                            top: 40,
                            left: 145,
                            child: Icon(
                              Icons.play_circle_outline,
                              color: Colors.white,
                              size: 90,
                            ),
                          ),
                          Positioned(
                            top: 160,
                            left: 90,
                            child: Text(
                              'Preview this course',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 22,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              GetBuilder<PaymentGateway>(
                init: PaymentGateway(),
                builder: (value) {
                  return GestureDetector(
                    onTap: () {
                      value.dispatchPayment(
                        349900,
                        'Priyam Soni',
                        9876543210,
                        'test@gmail.com',
                        'GooglePay',
                      );
                    },
                    child: Container(
                      width: double.infinity,
                      height: 45,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: Colors.redAccent.shade200,
                      ),
                      child: Center(
                        child: Text(
                          'Buy Now',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
              Padding(
                padding: EdgeInsets.only(top: 15.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: () async {
                        await FirebaseFirestore.instance
                            .collection('mylist')
                            .add({
                          'title': Get.arguments['title'],
                          'image': Get.arguments['image'],
                          'author': Get.arguments['author'],
                          'ratings': Get.arguments['ratings'],
                          'price': Get.arguments['price'],
                          'enrolled': Get.arguments['enrolled'],
                        }).whenComplete(() {
                          Get.snackbar(
                            'HURRAY',
                            '${Get.arguments['title']} is added to your cart',
                            colorText: Colors.black,
                            snackPosition: SnackPosition.BOTTOM,
                          );
                        });
                      },
                      child: Container(
                        width: 180,
                        height: 35,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: Colors.grey.shade300,
                        ),
                        child: Center(
                          child: Text(
                            'Add to Cart',
                            style: TextStyle(
                              color: Colors.grey.shade900,
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () async {
                        await FirebaseFirestore.instance
                            .collection('wishlist')
                            .add({
                          'title': Get.arguments['title'],
                          'image': Get.arguments['image'],
                          'author': Get.arguments['author'],
                          'ratings': Get.arguments['ratings'],
                          'price': Get.arguments['price'],
                          'enrolled': Get.arguments['enrolled'],
                        }).whenComplete(() {
                          Get.snackbar(
                            'HURRAY',
                            '${Get.arguments['title']} is added to your wishlist',
                            colorText: Colors.black,
                            snackPosition: SnackPosition.BOTTOM,
                          );
                        });
                      },
                      child: Container(
                        width: 180,
                        height: 35,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: Colors.grey.shade300,
                        ),
                        child: Center(
                          child: Text(
                            'Add to Wishlist',
                            style: TextStyle(
                              color: Colors.grey.shade900,
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
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
