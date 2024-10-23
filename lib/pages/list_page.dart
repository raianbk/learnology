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
    'Something',
  ];

  CategoriesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Wishlist'),
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
