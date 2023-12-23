import 'package:flutter/material.dart';
import 'package:Proyecto_labo4/models/product.dart';
import 'dart:convert';

class DetalleProducto extends StatelessWidget {
  static const String routeName = '/Detalle';

  @override
  Widget build(BuildContext context) {
    final String productJson =
        ModalRoute.of(context)!.settings.arguments as String;
    final Producto product = Producto.fromJson(json.decode(productJson));

    return Scaffold(
      appBar: AppBar(
        title: Text('Detalle Producto'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              alignment: Alignment.center,
              child: Text(
                product.nombre,
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(height: 10),
            Text(
              'Precio: ${product.precio.toString()}',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 10),
            Text(
              'Descripcion: ${product.descripcion}',
              style: TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}
