import 'package:flutter/material.dart';

class CategoriesPage extends StatelessWidget {
  // List of categories
  final List<String> categories = [
    'Technology',
    'Science',
    'Health',
    'Business',
    'Education',
    'Entertainment',
    'Sports',
    'Travel',
    'Food',
  ];

  CategoriesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text(
          'Wishlist',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: List.generate(
              categories.length,
              (index) => ListTile(
                    title: Text(categories[index]),
                    onTap: null,
                  )),
        ),
      ),
    );
  }
}
