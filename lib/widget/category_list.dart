// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';

class CategoryList extends StatelessWidget {
  var colors = [
    Colors.red,
    Colors.amber,
    Colors.cyan,
    Colors.green,
    Colors.blue,
  ];
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
  
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemExtent: 250.0,
        itemCount: 5, //changed
        itemBuilder: (context, index) => Container(
          padding: EdgeInsets.all(10.0),
          child: Material(
              elevation: 4.0,
              borderRadius: BorderRadius.circular(10.0),
              color: colors[index], 
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Icon(
                      Icons.book,
                      color: Colors.white,
                    ),
                    SizedBox(height: 10.0),
                    Text(
                      "We are using a Container of height 200 to show the horizontal list. Three Container are passed as the child of the list view.",
                      style: TextStyle(color: Colors.white),
                    ),
                    SizedBox(height: 10.0),
                    Icon(
                      Icons.add,
                      color: Colors.white,
                    ),
                  ],
                ),
              )),
        ),
      ),
    );
  }
}
