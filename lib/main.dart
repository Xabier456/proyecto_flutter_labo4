import 'package:flutter/material.dart';
import 'package:Proyecto_labo4/home.dart';
import 'package:Proyecto_labo4/screens/product_detail_screen.dart';
import 'package:Proyecto_labo4/screens/products_list_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter prototipo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Home(),
      routes: {
        ListaProducto.routeName: (context) => ListaProducto(),
        DetalleProducto.routeName: (context) => DetalleProducto()
      },
    );
  }
}
