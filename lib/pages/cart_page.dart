// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:learnology/components/my_button.dart';
import 'package:learnology/provider/cart_provider.dart';
import 'package:provider/provider.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    final cartItems = Provider.of<CartProvider>(context).cartItems;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Your Cart'),
      ),
      body: cartItems.isEmpty
          ? const Center(
              child: Text('Your cart is empty!'),
            )
          : Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: ListView.builder(
                    itemCount: cartItems.length,
                    itemBuilder: (context, index) {
                      final course = cartItems[index];
                      return Card(
                        child: ListTile(
                          leading: Image.asset(
                            'assets/placeholder.jpg', // Replace with the actual path or logic
                            width: 50, // Specify the width of the image
                            height: 50, // Specify the height of the image
                            fit: BoxFit
                                .cover, // Adjust how the image fits in the space
                          ),
                          title: Text(course.title),
                          subtitle: Text('\$${course.price}'),
                          trailing: IconButton(
                            icon: const Icon(Icons.remove_circle),
                            onPressed: () {
                              Provider.of<CartProvider>(context, listen: false)
                                  .removeFromCart(course);
                            },
                          ),
                        ),
                      );
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Total',
                        style: TextStyle(fontSize: 20),
                      ),
                      Text(
                        '\$${Provider.of<CartProvider>(context, listen: true).totalPrice()}',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: MyButton(
                    padValue: 15,
                    color: Colors.black,
                    btnText: 'Check Out',
                    onTap: () {
                      // Implement checkout logic or navigation here
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                            content: Text('Checkout feature coming soon!')),
                      );
                    },
                  ),
                )
              ],
            ),
    );
  }
}
