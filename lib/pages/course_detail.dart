// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:learnology/model/course_model.dart';
import 'package:learnology/provider/cart_provider.dart';
import 'package:provider/provider.dart';

class CourseDetail extends StatefulWidget {
  const CourseDetail({super.key});

  @override
  State<CourseDetail> createState() => _CourseDetailState();
}

class _CourseDetailState extends State<CourseDetail> {
  @override
  Widget build(BuildContext context) {
    final course = ModalRoute.of(context)!.settings.arguments as Course;
    return Scaffold(
      appBar: AppBar(
        title: Text(course.title),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 10),
            Text(
              course.title,
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text(course.description),
            SizedBox(height: 10),
            Text('\$${course.price}', style: TextStyle(fontSize: 18)),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Add course to the cart
                Provider.of<CartProvider>(context, listen: false)
                    .addToCart(course);
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('${course.title} added to cart!')),
                );
              },
              child: Text('Add to Cart'),
            ),
          ],
        ),
      ),
    );
  }
}
