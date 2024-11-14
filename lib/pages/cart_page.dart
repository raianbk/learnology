import 'package:flutter/material.dart';
import 'package:learnology/provider/cart_provider.dart';
import 'package:provider/provider.dart';

class CartPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final cartItems = Provider.of<CartProvider>(context).cartItems;

    return Scaffold(
      appBar: AppBar(
        title: Text('Your Cart'),
      ),
      body: cartItems.isEmpty
          ? Center(
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
                      return ListTile(
                        title: Text(course.title),
                        subtitle: Text('\$${course.price}'),
                        trailing: IconButton(
                          icon: Icon(Icons.remove_circle),
                          onPressed: () {
                            Provider.of<CartProvider>(context, listen: false)
                                .removeFromCart(course);
                          },
                        ),
                      );
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: ElevatedButton(
                    onPressed: () {
                      // Implement checkout logic or navigation here
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                            content: Text('Checkout feature coming soon!')),
                      );
                    },
                    child: Text('Checkout'),
                  ),
                ),
              ],
            ),
    );
  }
}
