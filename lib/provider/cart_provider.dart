import 'package:flutter/material.dart';
import 'package:learnology/model/course_model.dart'; // Assuming Course model is already created.

class CartProvider with ChangeNotifier {
  final List<Course> _cartItems = [];

  List<Course> get cartItems => _cartItems;
  int get cartCount => _cartItems.length;

  void addToCart(Course course) {
    _cartItems.add(course);
    notifyListeners();
  }

  void removeFromCart(Course course) {
    _cartItems.remove(course);
    notifyListeners();
  }

  String totalPrice() {
    double price = 0;
    for (int i = 0; i < _cartItems.length; i++) {
      price += _cartItems[i].price.toDouble();
    }
    return price.toString();
  }
}
