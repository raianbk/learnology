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
    return SizedBox(
      child: Padding(
        padding: EdgeInsets.all(5),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRect(
              child: Image.asset(
                'assets/placeholder.jpg',
                // width: double.infinity,
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
