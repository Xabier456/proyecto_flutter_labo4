import 'package:flutter/material.dart';
import 'screens/products_list_screen.dart'; // Import the products list screen

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
      ),
      body: Center(
        // Add a button to navigate to the products list screen
        child: ElevatedButton(
          child: Text('lista de productos!'),
          onPressed: () {
            ;
            Navigator.pushNamed(context, ListaProducto.routeName);
          },
        ),
      ),
    );
  }
}
