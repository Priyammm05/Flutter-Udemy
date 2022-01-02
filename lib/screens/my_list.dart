// ignore_for_file: prefer_const_constructors

import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:udemy_clone/services/data_controller.dart';

class MyList extends StatefulWidget {
  const MyList({Key? key}) : super(key: key);

  @override
  _MyListState createState() => _MyListState();
}

class _MyListState extends State<MyList> {
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
      ),
      body: GetBuilder<DataController>(
        init: DataController(),
        builder: (value) {
          return FutureBuilder(
            future: value.getData('mylist'),
            builder: (context, AsyncSnapshot snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(
                  child: CircularProgressIndicator(color: Colors.black),
                );
              } else {
                return ListView.builder(
                  itemCount: snapshot.data!.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Padding(
                      padding: EdgeInsets.only(top: 1.0, bottom: 2.0),
                      child: GestureDetector(
                        child: Card(
                          color: Colors.black,
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Column(
                                  children: [
                                    Container(
                                      height: 75,
                                      width: 100,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(4),
                                        image: DecorationImage(
                                          image: NetworkImage(
                                            snapshot.data[index]
                                                .data()['image'],
                                          ),
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                Padding(
                                  padding: EdgeInsets.only(left: 10.0),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        constraints: BoxConstraints(
                                          maxWidth: 270,
                                        ),
                                        child: Padding(
                                          padding: EdgeInsets.only(
                                            top: 2.0,
                                            bottom: 2.0,
                                          ),
                                          child: Text(
                                            snapshot.data[index]
                                                .data()['title'],
                                            overflow: TextOverflow.ellipsis,
                                            maxLines: 2,
                                            style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              color: Colors.grey.shade400,
                                            ),
                                          ),
                                        ),
                                      ),
                                      Text(
                                        snapshot.data[index].data()['author'],
                                        overflow: TextOverflow.ellipsis,
                                        maxLines: 1,
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: Colors.grey.shade600,
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only(
                                            top: 2.0, bottom: 2.0),
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
                                      Text(
                                        ('\u{20B9} ${snapshot.data[index].data()['price']}'),
                                        style: TextStyle(
                                          color: Colors.grey.shade600,
                                          fontSize: 18,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
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
    );
  }
}
