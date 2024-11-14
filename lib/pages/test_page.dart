// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:learnology/model/course_model.dart';
import 'package:learnology/provider/cart_provider.dart';
import 'package:provider/provider.dart';

class TestPage extends StatefulWidget {
  TestPage({super.key});

  @override
  State<TestPage> createState() => _TestPageState();
}

class _TestPageState extends State<TestPage> {
  // final Course _course;
  // @override
// //  void initState() {
//     super.initState();
//     addDummyCoursesToFirestore(); // Call the function to add dummy data
//   }

  // final List<Map<String, dynamic>> dummyCourses = [
  //   {
  //     "category": "Development",
  //     "title": "Flutter Development",
  //     "description":
  //         "Learn Flutter and Dart from scratch. Build cross-platform apps for iOS and Android. Develop visually appealing UIs with ease.",
  //     "price": 19.99,
  //     "thumbnail": "https://example.com/flutter.jpg"
  //   },
  //   {
  //     "category": "Data Science",
  //     "title": "Data Science with Python",
  //     "description":
  //         "Master data science and machine learning concepts. Work with libraries like Pandas and Scikit-Learn. Apply Python skills to real-world projects.",
  //     "price": 29.99,
  //     "thumbnail": "https://example.com/python.jpg"
  //   },
  //   {
  //     "category": "Marketing",
  //     "title": "Digital Marketing",
  //     "description":
  //         "Grow your business with effective strategies. Understand social media, SEO, and analytics. Launch successful campaigns for any niche.",
  //     "price": 15.99,
  //     "thumbnail": "https://example.com/marketing.jpg"
  //   },
  //   {
  //     "category": "Design",
  //     "title": "Graphic Design Basics",
  //     "description":
  //         "Learn the fundamentals of graphic design. Improve visual communication and aesthetics. Explore tools like Photoshop and Illustrator.",
  //     "price": 17.99,
  //     "thumbnail": "https://example.com/design.jpg"
  //   },
  //   {
  //     "category": "Business",
  //     "title": "Entrepreneurship 101",
  //     "description":
  //         "Start your own business with confidence. Learn essential business skills and strategies. Turn ideas into successful ventures.",
  //     "price": 24.99,
  //     "thumbnail": "https://example.com/entrepreneurship.jpg"
  //   },
  //   {
  //     "category": "Finance",
  //     "title": "Personal Finance Management",
  //     "description":
  //         "Take control of your finances. Learn budgeting, saving, and investing basics. Build a secure financial future.",
  //     "price": 12.99,
  //     "thumbnail": "https://example.com/finance.jpg"
  //   },
  //   {
  //     "category": "Health",
  //     "title": "Yoga for Beginners",
  //     "description":
  //         "Start your journey into yoga practice. Learn fundamental poses and breathing techniques. Improve flexibility and relieve stress.",
  //     "price": 10.99,
  //     "thumbnail": "https://example.com/yoga.jpg"
  //   },
  //   {
  //     "category": "Cooking",
  //     "title": "Healthy Cooking Essentials",
  //     "description":
  //         "Master the basics of healthy cooking. Learn nutritious recipes and meal planning. Bring delicious and wholesome meals to your table.",
  //     "price": 9.99,
  //     "thumbnail": "https://example.com/cooking.jpg"
  //   },
  //   {
  //     "category": "Music",
  //     "title": "Guitar for Beginners",
  //     "description":
  //         "Learn to play the guitar from scratch. Master basic chords, strumming, and rhythm. Play your favorite songs with confidence.",
  //     "price": 18.99,
  //     "thumbnail": "https://example.com/guitar.jpg"
  //   },
  //   {
  //     "category": "Photography",
  //     "title": "Photography Essentials",
  //     "description":
  //         "Capture stunning photos with ease. Understand composition, lighting, and camera settings. Improve your photography skills step by step.",
  //     "price": 22.99,
  //     "thumbnail": "https://example.com/photography.jpg"
  //   }
  // ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text(
          'Featured',
          style: TextStyle(color: Colors.white),
        ),
        actions: [
          // Cart Icon with Badge
          Consumer<CartProvider>(
            builder: (context, cart, child) {
              return IconButton(
                icon: Stack(
                  children: [
                    const Icon(
                      Icons.shopping_cart,
                    ),
                    if (cart.cartCount > 0)
                      Positioned(
                        right: 0,
                        top: -5,
                        child: Container(
                          padding: const EdgeInsets.all(4),
                          decoration: BoxDecoration(
                              color: Colors.red, shape: BoxShape.circle),
                          constraints: const BoxConstraints(
                            minWidth: 10,
                            minHeight: 10,
                          ),
                          child: Text(
                            '${cart.cartCount}',
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 10,
                              fontWeight: FontWeight.bold,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                  ],
                ),
                onPressed: () {
                  // Navigate to Cart page
                  Navigator.pushNamed(context, '/cart');
                },
              );
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 160,
                width: 400,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage('assets/placeholder.jpg'),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 10.0, bottom: 15.0),
                child: Container(
                  height: 68,
                  width: 400,
                  color: Colors.lightBlueAccent,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        'Courses now on sale',
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                      Text(
                        '1 Day Left',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(bottom: 15),
                child: Text(
                  'Featured',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * .5,
                width: 460,
                child: FutureBuilder<List<Course>>(
                  future: fetchCourses(),
                  builder: courseTile,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(bottom: 0),
                child: Text(
                  'Categories',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(
                height: 60,
                child: FutureBuilder<List<String>>(
                  future: fetchCategoryList(),
                  builder: categoryTile,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<List<Course>> fetchCourses() async {
    final snapshot =
        await FirebaseFirestore.instance.collection('Courses Collection').get();
    return snapshot.docs
        .map((doc) => Course.fromFirestore(doc.data()))
        .toList();
  }

  Future<List<String>> fetchCategoryList() async {
    // Access the Firestore collection
    final snapshot =
        await FirebaseFirestore.instance.collection('Courses Collection').get();

    // Map each document to its 'category' field, then convert to a set to remove duplicates
    List<String> categoryList = snapshot.docs
        .map((doc) => doc['category'] as String)
        .toSet() // Removes duplicate categories
        .toList();
    return categoryList;
  }

  Widget courseTile(context, snapshot) {
    if (snapshot.connectionState == ConnectionState.waiting) {
      return const Center(child: CircularProgressIndicator());
    } else if (snapshot.hasError) {
      return Center(child: Text('Error: ${snapshot.error}'));
    } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
      return const Center(child: Text('No courses available'));
    } else {
      final courses = snapshot.data!;
      return ListView.builder(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemCount: 5,
        itemBuilder: (context, int index) {
          final course = courses[index];
          return GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, '/course_detail', arguments: course);
            },
            child: Padding(
              padding: EdgeInsets.only(bottom: 10),
              child: Flexible(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: 100,
                      width: 200,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          fit: BoxFit.fitWidth,
                          image: AssetImage('assets/placeholder.jpg'),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 10, bottom: 4),
                      child: Container(
                        constraints: BoxConstraints(
                          maxWidth: 220,
                        ),
                        child: Text(
                          course.title,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 2,
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ),
                    Container(
                      constraints: BoxConstraints(
                        maxWidth: 210,
                      ),
                      child: Text(
                        course.description,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 4,
                        style: TextStyle(
                          color: Colors.grey.shade600,
                          fontSize: 14,
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 4.0),
                      child: Row(),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 2.0),
                      child: Text(
                        '\$ ${course.price}',
                        style: TextStyle(
                          color: Colors.amber,
                          fontSize: 20,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 5.0),
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.yellowAccent,
                          borderRadius: BorderRadius.circular(4),
                        ),
                        child: Padding(
                          padding: EdgeInsets.all(5),
                          child: Text(
                            'Bestseller',
                            style: TextStyle(
                              color: Colors.brown,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      );
    }
  }

  Widget categoryTile(context, snapshot) {
    if (snapshot.connectionState == ConnectionState.waiting) {
      return const Center(child: CircularProgressIndicator());
    } else if (snapshot.hasError) {
      return Center(child: Text('Error: ${snapshot.error}'));
    } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
      return const Center(child: Text('No courses available'));
    } else {
      final categories = snapshot.data!;
      return ListView.builder(
        // shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemCount: categories.length,
        itemBuilder: (context, int index) {
          return GestureDetector(
              onTap: () {},
              child: Padding(
                padding: EdgeInsets.all(10),
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.blueAccent,
                      borderRadius: BorderRadius.all(Radius.circular(20))),
                  padding: EdgeInsets.all(10),
                  child: Text(
                    categories[index],
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ));
        },
      );
    }
  }
}
