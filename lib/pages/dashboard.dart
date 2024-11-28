import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:learnology/constants.dart';

class InstructorDashboard extends StatelessWidget {
  const InstructorDashboard();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Instructor Dashboard'),
        actions: [
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => AddCourseScreen(),
                ),
              );
            },
          ),
        ],
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance
            .collection('Courses Collection')
            .snapshots(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }

          if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
            return Center(child: Text('No courses uploaded yet.'));
          }

          final courses = snapshot.data!.docs;

          return ListView.builder(
            itemCount: courses.length,
            itemBuilder: (context, index) {
              final course = courses[index];
              return Card(
                child: ListTile(
                  title: Text(course['title']),
                  subtitle: Text('Price: \$${course['price']}'),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                        icon: Icon(Icons.edit),
                        onPressed: () {},
                      ),
                      IconButton(
                        icon: Icon(Icons.delete),
                        onPressed: () async {
                          // Delete the course
                          await FirebaseFirestore.instance
                              .collection('Courses Collection')
                              .doc(course.id)
                              .delete();
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                                content: Text('Course deleted successfully.')),
                          );
                        },
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}

class AddCourseScreen extends StatefulWidget {
  AddCourseScreen();

  @override
  _AddCourseScreenState createState() => _AddCourseScreenState();
}

class _AddCourseScreenState extends State<AddCourseScreen> {
  final _formKey = GlobalKey<FormState>();
  final _titleController = TextEditingController();
  final _descriptionController = TextEditingController();
  final _priceController = TextEditingController();
  final _categoryController = TextEditingController();
  bool _isLoading = false;

  Future<void> addCourse() async {
    if (!_formKey.currentState!.validate()) return;

    setState(() {
      _isLoading = true;
    });

    try {
      await FirebaseFirestore.instance.collection('Courses Collection').add({
        'title': _titleController.text.trim(),
        'description': _descriptionController.text.trim(),
        'price': int.parse(_priceController.text.trim()),
        'category': _categoryController.text.trim(),
        'thumbnail': '',
        'createdAt': FieldValue.serverTimestamp(),
        'imageUrl': ''
      });

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Course added successfully!')),
      );

      Navigator.pop(context);
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Failed to add course: ${e.toString()}')),
      );
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Add Course')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              TextFormField(
                controller: _titleController,
                decoration: InputDecoration(labelText: 'Course Title'),
                validator: (value) =>
                    value == null || value.isEmpty ? 'Title is required' : null,
              ),
              TextFormField(
                controller: _descriptionController,
                decoration: InputDecoration(labelText: 'Description'),
                maxLines: 4,
                validator: (value) => value == null || value.isEmpty
                    ? 'Description is required'
                    : null,
              ),
              TextFormField(
                controller: _priceController,
                decoration: InputDecoration(labelText: 'Price'),
                keyboardType: TextInputType.number,
                validator: (value) =>
                    value == null || double.tryParse(value) == null
                        ? 'Enter a valid price'
                        : null,
              ),
              TextFormField(
                controller: _categoryController,
                decoration: InputDecoration(labelText: 'Category'),
                validator: (value) => value == null || value.isEmpty
                    ? 'Category is required'
                    : null,
              ),
              SizedBox(height: 16.0),
              _isLoading
                  ? Center(child: CircularProgressIndicator())
                  : ElevatedButton(
                      onPressed: addCourse,
                      child: Text('Add Course'),
                    ),
            ],
          ),
        ),
      ),
    );
  }
}
