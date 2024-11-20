// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:learnology/components/my_button.dart';
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
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 200,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    fit: BoxFit.fitWidth,
                    image: AssetImage('assets/placeholder.jpg'),
                  ),
                ),
              ),
              SizedBox(height: 10),
              Text(
                course.title,
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              Text(course.description),
              SizedBox(height: 10),
              Text('\$${course.price}',
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold)),
              SizedBox(height: 20),
              MyButton(
                padValue: 15,
                color: Colors.blue,
                onTap: () {
                  // Add course to the cart
                  Provider.of<CartProvider>(context, listen: false)
                      .addToCart(course);
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('${course.title} added to cart!')),
                  );
                },
                btnText: 'Add to Cart',
              ),
              SizedBox(height: 5),
              MyButton(
                padValue: 15,
                color: const Color.fromARGB(255, 241, 130, 122),
                onTap: () {},
                btnText: 'Buy Now',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
