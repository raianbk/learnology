import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:learnology/components/course_tile.dart';
import 'package:learnology/constants.dart';
import 'package:learnology/model/course_model.dart';

class TestPage extends StatelessWidget {
  // final Course _course;

  const TestPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Featured'),
        ),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Browse Courses',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                Expanded(
                  child: FutureBuilder<List<Course>>(
                    future: fetchCourses(),
                    builder: tileWidget,
                  ),
                ),
              ],
            ),
          ),
        ));
  }

  Future<List<Course>> fetchCourses() async {
    final snapshot =
        await FirebaseFirestore.instance.collection('Courses Collection').get();
    return snapshot.docs
        .map((doc) => Course.fromFirestore(doc.data()))
        .toList();
  }

  Widget tileWidget(context, snapshot) {
    if (snapshot.connectionState == ConnectionState.waiting) {
      return const Center(child: CircularProgressIndicator());
    } else if (snapshot.hasError) {
      return Center(child: Text('Error: ${snapshot.error}'));
    } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
      return const Center(child: Text('No courses available'));
    } else {
      final courses = snapshot.data!;
      return ListView.builder(
        itemCount: courses.length,
        itemBuilder: (context, index) {
          final course = courses[index];
          return CourseTile(
            course: course,
          );
        },
      );
    }
  }
}
