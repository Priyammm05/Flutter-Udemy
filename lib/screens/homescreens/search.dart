// ignore_for_file: prefer_const_constructors, prefer_final_fields, prefer_const_literals_to_create_immutables, avoid_unnecessary_containers

import 'dart:ui';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:udemy_clone/screens/details/detail_screen.dart';
import 'package:udemy_clone/services/data_controller.dart';

class Search extends StatefulWidget {
  const Search({Key? key}) : super(key: key);

  @override
  _SearchState createState() => _SearchState();
}

class _SearchState extends State<Search> {
  TextEditingController _searchController = TextEditingController();
  QuerySnapshot? querySnapshot;
  bool isExecuted = false;

  @override
  Widget build(BuildContext context) {
    Widget searchedData() {
      return ListView.builder(
        itemCount: querySnapshot!.docs.length,
        itemBuilder: (BuildContext context, int index) {
          return Padding(
            padding: EdgeInsets.only(top: 8.0),
            child: GestureDetector(
              onTap: () {
                Get.to(
                  () => DetailedScreen(),
                  transition: Transition.downToUp,
                  arguments: querySnapshot!.docs[index],
                );
              },
              child: ListTile(
                leading: CircleAvatar(
                  radius: 25,
                  backgroundImage: NetworkImage(
                    (querySnapshot!.docs[index].data() as Map)['image'],
                  ),
                ),
                title: Text(
                  (querySnapshot!.docs[index].data() as Map)['title'],
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                subtitle: Padding(
                  padding: EdgeInsets.only(top: 4.0),
                  child: Text(
                    (querySnapshot!.docs[index].data() as Map)['author'],
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                    style: TextStyle(
                      color: Colors.grey.shade500,
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      );
    }

    return Scaffold(
      backgroundColor: Colors.black,
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.clear),
        onPressed: () {
          _searchController.text = '';
          setState(() {
            isExecuted = false;
          });
        },
      ),
      appBar: AppBar(
        actions: [
          GetBuilder<DataController>(
            init: DataController(),
            builder: (value) {
              return IconButton(
                onPressed: () {
                  value.queryData(_searchController.text).then((val) {
                    querySnapshot = val;
                    setState(() {
                      isExecuted = true;
                    });
                  });
                },
                icon: Icon(EvaIcons.searchOutline),
              );
            },
          ),
        ],
        backgroundColor: Colors.black,
        title: TextField(
          controller: _searchController,
          style: TextStyle(color: Colors.white),
          decoration: InputDecoration(
            hintText: 'Search Courses',
            hintStyle: TextStyle(color: Colors.white),
          ),
        ),
      ),
      body: isExecuted
          ? searchedData()
          : Container(
              child: Center(
                child: Text(
                  'Search any courses',
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
