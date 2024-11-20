import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class CategoriesPage extends StatelessWidget {
  CategoriesPage({super.key});

  Future<List<String>> fetchCategories() async {
    // Fetch data from Firestore
    final querySnapshot =
        await FirebaseFirestore.instance.collection('Courses Collection').get();

    // Extract unique categories
    final categories = querySnapshot.docs
        .map((doc) =>
            doc['category'] as String) // Assuming category field exists
        .toSet() // Remove duplicates
        .toList();

    return categories;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text(
          'Categories',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: FutureBuilder<List<String>>(
        future: fetchCategories(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text('No categories found.'));
          } else {
            final categories = snapshot.data!;
            return ListView.builder(
              itemCount: categories.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(categories[index]),
                  onTap: () {
                    Navigator.pushNamed(context, '/category',
                        arguments: categories[index]);
                  },
                );
              },
            );
          }
        },
      ),
    );
  }
}
