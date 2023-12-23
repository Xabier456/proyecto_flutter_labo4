import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:Proyecto_labo4/models/product.dart';
import 'dart:convert';

import 'package:Proyecto_labo4/screens/product_detail_screen.dart';

class ListaProducto extends StatefulWidget {
  const ListaProducto({Key? key}) : super(key: key);

  static const String routeName = '/lista';

  @override
  _ProductListScreenState createState() => _ProductListScreenState();
}

class _ProductListScreenState extends State<ListaProducto> {
  List<Producto> allProducts = [];
  List<Producto> filteredProducts = [];
  bool sortByPriceDescending = false;

  @override
  void initState() {
    super.initState();
    readJsonFile();
  }

  Future<void> readJsonFile() async {
    final String response = await rootBundle.loadString('assets/products.json');
    final productData = await json.decode(response);

    var list = productData["items"] as List<dynamic>;

    setState(() {
      allProducts = list.map((e) => Producto.fromJson(e)).toList();
      filteredProducts = allProducts;
      filtrarPorNombre();
    });
  }

  void filtrarPorNombre() {
    setState(() {
      filteredProducts.sort((a, b) => a.nombre.compareTo(b.nombre));
    });
  }

  void filtrarPorPrecio() {
    setState(() {
      sortByPriceDescending = !sortByPriceDescending;
      filteredProducts.sort((a, b) {
        if (sortByPriceDescending) {
          return b.precio.compareTo(a.precio);
        } else {
          return a.precio.compareTo(b.precio);
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Lista Productos"),
        actions: [
          IconButton(
            icon: Icon(Icons.sort_by_alpha),
            onPressed: filtrarPorNombre,
          ),
          IconButton(
            icon: Icon(sortByPriceDescending
                ? Icons.arrow_downward
                : Icons.arrow_upward),
            onPressed: filtrarPorPrecio,
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: filteredProducts.length,
        itemBuilder: (BuildContext context, index) {
          return Card(
            margin: EdgeInsets.all(15.0),
            color: Color.fromARGB(255, 96, 223, 255),
            child: ListTile(
              title: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(filteredProducts[index].nombre),
              ),
              subtitle: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  filteredProducts[index].precio.toString(),
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
              onTap: () {
                Navigator.of(context).pushNamed(
                  DetalleProducto.routeName,
                  arguments: jsonEncode(filteredProducts[index]),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
