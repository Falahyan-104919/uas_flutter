import 'package:flutter/material.dart';
import 'package:restfull_api_app/services/api_service.dart';
import 'dart:async';
import 'package:restfull_api_app/models/product.dart';
import 'package:restfull_api_app/product_list.dart';

import 'addDataWidget.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Restfull API App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final ApiService api = ApiService();
  List<Product> products = [];

  @override
  Widget build(BuildContext context) {
    if (products == null) {
      products = <Product>[];
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('Restfull API App'),
      ),
      body: Container(
        child: FutureBuilder(
          future: loadList(),
          builder: (context, snapshot) {
            return products.length > 0
                ? new ProductList(products: products)
                : Center(child: CircularProgressIndicator());
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _navigateToAddScreen(context);
        },
        child: Icon(Icons.add),
      ),
    );
  }

  Future loadList() {
    Future<List<Product>> future = api.getProduct();
    future.then((value) {
      setState(() {
        products = value;
      });
    });
    return future;
  }

  _navigateToAddScreen(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => AddDataWidget()),
    );
  }
}
