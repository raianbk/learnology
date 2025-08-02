// ignore_for_file: prefer_const_constructors

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class CourseListPage extends StatelessWidget {
  const CourseListPage({super.key});

  Future<List<Map<String, dynamic>>> fetchCoursesByCategory(
      String category) async {
    final querySnapshot = await FirebaseFirestore.instance
        .collection('Courses Collection')
        .where('category', isEqualTo: category) // Filter by category
        .get();

    return querySnapshot.docs
        .map((doc) => doc.data())
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    final category = ModalRoute.of(context)?.settings.arguments as String;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text(
          'Courses in $category',
          style: const TextStyle(color: Colors.white),
        ),
      ),
      body: FutureBuilder<List<Map<String, dynamic>>>(
        future: fetchCoursesByCategory(category),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(
                child: Text('No courses found in this category.'));
          } else {
            final courses = snapshot.data!;
            return ListView.builder(
              itemCount: courses.length,
              itemBuilder: (context, index) {
                final course = courses[index];
                return Card(
                  child: ListTile(
                    title: Text(
                      course['title'] ?? 'No Title',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    subtitle: Text(
                      '\$${course['price'] ?? 'N/A'}',
                      style: TextStyle(fontSize: 18),
                    ),
                    trailing:
                        Image(image: AssetImage('assets/placeholder.jpg')),
                    onTap: () {
                      // Handle navigation to course details if needed
                    },
                  ),
                );
              },
            );
          }
        },
      ),
    );
  }
}
