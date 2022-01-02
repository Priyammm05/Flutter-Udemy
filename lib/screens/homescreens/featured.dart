// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, sized_box_for_whitespace, avoid_unnecessary_containers

import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:udemy_clone/screens/details/detail_screen.dart';
import 'package:udemy_clone/screens/my_list.dart';
import 'package:udemy_clone/services/data_controller.dart';

class Featured extends StatefulWidget {
  const Featured({Key? key}) : super(key: key);

  @override
  _FeaturedState createState() => _FeaturedState();
}

class _FeaturedState extends State<Featured> {
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
          'Featured',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(10.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 160,
                width: 400,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage('images/sales1.jpg'),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 10.0, bottom: 15.0),
                child: Container(
                  height: 68,
                  width: 400,
                  color: Colors.lightBlueAccent,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        'Courses now on sale',
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                      Text(
                        '1 Day Left',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(bottom: 15),
                child: Text(
                  'Featured',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Container(
                height: 280,
                width: 460,
                child: GetBuilder<DataController>(
                  init: DataController(),
                  builder: (value) {
                    return FutureBuilder(
                      future: value.getData('featured'),
                      builder: (context, AsyncSnapshot snapshot) {
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return Center(
                            child: CircularProgressIndicator(
                              backgroundColor: Colors.black,
                            ),
                          );
                        } else {
                          return ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: snapshot.data!.length,
                            itemBuilder: (BuildContext context, int index) {
                              return GestureDetector(
                                onTap: () {
                                  Get.to(
                                    () => DetailedScreen(),
                                    transition: Transition.leftToRightWithFade,
                                    arguments: snapshot.data[index],
                                  );
                                },
                                child: Padding(
                                  padding: EdgeInsets.only(
                                    bottom: 10,
                                  ),
                                  child: Container(
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Container(
                                          height: 120,
                                          width: 200,
                                          decoration: BoxDecoration(
                                            image: DecorationImage(
                                              fit: BoxFit.fitWidth,
                                              image: NetworkImage(
                                                snapshot.data[index]
                                                    .data()['image'],
                                              ),
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding: EdgeInsets.only(
                                              top: 10, bottom: 8),
                                          child: Container(
                                            constraints: BoxConstraints(
                                              maxWidth: 220,
                                            ),
                                            child: Text(
                                              snapshot.data[index]
                                                  .data()['title'],
                                              overflow: TextOverflow.ellipsis,
                                              maxLines: 2,
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 16,
                                              ),
                                            ),
                                          ),
                                        ),
                                        Container(
                                          constraints: BoxConstraints(
                                            maxWidth: 210,
                                          ),
                                          child: Text(
                                            snapshot.data[index]
                                                .data()['author'],
                                            overflow: TextOverflow.ellipsis,
                                            maxLines: 1,
                                            style: TextStyle(
                                              color: Colors.grey.shade600,
                                              fontSize: 14,
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding: EdgeInsets.only(top: 4.0),
                                          child: Row(
                                            children: [
                                              Icon(
                                                EvaIcons.star,
                                                color: Colors.yellow,
                                                size: 13.0,
                                              ),
                                              Icon(
                                                EvaIcons.star,
                                                color: Colors.yellow,
                                                size: 13.0,
                                              ),
                                              Icon(
                                                EvaIcons.star,
                                                color: Colors.yellow,
                                                size: 13.0,
                                              ),
                                              Icon(
                                                EvaIcons.star,
                                                color: Colors.yellow,
                                                size: 13.0,
                                              ),
                                              Icon(
                                                EvaIcons.star,
                                                color: Colors.yellow,
                                                size: 13.0,
                                              ),
                                              SizedBox(width: 8),
                                              Text(
                                                snapshot.data[index]
                                                    .data()['ratings'],
                                                style: TextStyle(
                                                  color: Colors.grey.shade600,
                                                  fontSize: 12.5,
                                                ),
                                              ),
                                              SizedBox(width: 6),
                                              Text(
                                                ('(${snapshot.data[index].data()['enrolled']})'),
                                                style: TextStyle(
                                                  color: Colors.grey.shade600,
                                                  fontSize: 12.5,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(top: 4.0),
                                          child: Text(
                                            ('\u{20B9} ${snapshot.data[index].data()['price']}'),
                                            style: TextStyle(
                                              color: Colors.grey.shade600,
                                              fontSize: 20,
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(top: 5.0),
                                          child: Container(
                                            decoration: BoxDecoration(
                                              color: Colors.yellowAccent,
                                              borderRadius:
                                                  BorderRadius.circular(4),
                                            ),
                                            child: Padding(
                                              padding: EdgeInsets.all(5),
                                              child: Text(
                                                'Bestseller',
                                                style: TextStyle(
                                                  color: Colors.brown,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              );
                            },
                          );
                        }
                      },
                    );
                  },
                ),
              ),
              Padding(
                padding: EdgeInsets.only(bottom: 15, top: 10),
                child: Text(
                  'Top Courses in Development',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Container(
                height: 280,
                width: 450,
                child: GetBuilder<DataController>(
                  init: DataController(),
                  builder: (value) {
                    return FutureBuilder(
                      future: value.getData('top'),
                      builder: (context, AsyncSnapshot snapshot) {
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return Center(
                            child: CircularProgressIndicator(
                              backgroundColor: Colors.black,
                            ),
                          );
                        } else {
                          return ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: snapshot.data!.length,
                            itemBuilder: (BuildContext context, int index) {
                              return GestureDetector(
                                onTap: () {
                                  Get.to(
                                    () => DetailedScreen(),
                                    transition: Transition.leftToRightWithFade,
                                    arguments: snapshot.data[index],
                                  );
                                },
                                child: Padding(
                                  padding: EdgeInsets.only(
                                    bottom: 10,
                                  ),
                                  child: Container(
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Container(
                                          height: 120,
                                          width: 200,
                                          decoration: BoxDecoration(
                                            image: DecorationImage(
                                              fit: BoxFit.fitWidth,
                                              image: NetworkImage(
                                                snapshot.data[index]
                                                    .data()['image'],
                                              ),
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding: EdgeInsets.only(
                                              top: 10, bottom: 8),
                                          child: Container(
                                            constraints: BoxConstraints(
                                              maxWidth: 210,
                                            ),
                                            child: Text(
                                              snapshot.data[index]
                                                  .data()['title'],
                                              overflow: TextOverflow.ellipsis,
                                              maxLines: 2,
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 16,
                                              ),
                                            ),
                                          ),
                                        ),
                                        Container(
                                          constraints: BoxConstraints(
                                            maxWidth: 210,
                                          ),
                                          child: Text(
                                            snapshot.data[index]
                                                .data()['author'],
                                            overflow: TextOverflow.ellipsis,
                                            maxLines: 1,
                                            style: TextStyle(
                                              color: Colors.grey.shade600,
                                              fontSize: 14,
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding: EdgeInsets.only(top: 4.0),
                                          child: Row(
                                            children: [
                                              Icon(
                                                EvaIcons.star,
                                                color: Colors.yellow,
                                                size: 13.0,
                                              ),
                                              Icon(
                                                EvaIcons.star,
                                                color: Colors.yellow,
                                                size: 13.0,
                                              ),
                                              Icon(
                                                EvaIcons.star,
                                                color: Colors.yellow,
                                                size: 13.0,
                                              ),
                                              Icon(
                                                EvaIcons.star,
                                                color: Colors.yellow,
                                                size: 13.0,
                                              ),
                                              Icon(
                                                EvaIcons.star,
                                                color: Colors.yellow,
                                                size: 13.0,
                                              ),
                                              SizedBox(width: 8),
                                              Text(
                                                snapshot.data[index]
                                                    .data()['ratings'],
                                                style: TextStyle(
                                                  color: Colors.grey.shade600,
                                                  fontSize: 12.5,
                                                ),
                                              ),
                                              SizedBox(width: 6),
                                              Text(
                                                ('(${snapshot.data[index].data()['enrolled']})'),
                                                style: TextStyle(
                                                  color: Colors.grey.shade600,
                                                  fontSize: 12.5,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(top: 4.0),
                                          child: Text(
                                            ('\u{20B9} ${snapshot.data[index].data()['price']}'),
                                            style: TextStyle(
                                              color: Colors.grey.shade600,
                                              fontSize: 20,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              );
                            },
                          );
                        }
                      },
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
