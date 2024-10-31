// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:learnology/model/course_model.dart';

class CourseTile extends StatelessWidget {
  // final String title;
  // final String description;
  // final String price;

  final Course course;
  const CourseTile({
    super.key,
    required this.course,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(10.0),
      elevation: 0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRect(
              child: Image.asset(
                'assets/placeholder.jpg',
                width: double.infinity,
                height: 180,
                fit: BoxFit.fill,
              ),
            ),
            Text(
              course.title,
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Text(
              course.description,
              maxLines: 2,
              style: TextStyle(
                fontSize: 13,
              ),
            ),
            Text(
              '\$${course.price}',
              style: TextStyle(
                fontSize: 18,
                color: Colors.orange,
              ),
            )
          ],
        ),
      ),
    );
  }
}
