import 'package:flutter/material.dart';
import 'package:restfull_api_app/models/product.dart';
import 'detailWidget.dart';

class ProductList extends StatelessWidget {
  final List<Product> products;
  ProductList({Key? key, required this.products}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: products.length,
        itemBuilder: (BuildContext context, int index) {
          return Card(
            child: InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => DetailWidget(products[index])),
                );
              },
              child: ListTile(
                title: Text(products[index].nama_produk),
                subtitle: Text(products[index].harga),
              ),
            ),
          );
        });
  }
}
