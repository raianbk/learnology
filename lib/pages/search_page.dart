// ignore_for_file: prefer_const_constructors, prefer_final_fields, prefer_const_literals_to_create_immutables, avoid_unnecessary_containers

import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:flutter/material.dart';

class Search extends StatefulWidget {
  const Search({super.key});

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
              onTap: () {},
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
      backgroundColor: Colors.white,
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
        actions: [],
        backgroundColor: Colors.white,
        title: TextField(
          controller: _searchController,
          style: TextStyle(color: Colors.black),
          decoration: InputDecoration(
            hintText: 'Search Courses',
            hintStyle: TextStyle(color: Colors.black),
          ),
          onChanged: (val) {
            setState(() {});
          },
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
