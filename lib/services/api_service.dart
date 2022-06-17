import 'dart:convert';

import 'package:restfull_api_app/models/product.dart';
import 'package:http/http.dart';

class ApiService {
  final String apiUrl = 'http://10.0.2.2:8080/product';

  Future<List<Product>> getProduct() async {
    Response response = await get(Uri.parse(apiUrl));
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      final List<Product> product =
          data.map((e) => Product.fromJson(e)).toList();
      return product;
    } else {
      throw Exception('Failed to load data');
    }
  }

  Future<Product> getProductById(String id) async {
    Response response = await get(Uri.parse('$apiUrl/$id'));
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      final product = Product.fromJson(data);
      return product;
    } else {
      throw Exception('Failed to load data');
    }
  }

  Future<Product> createProduct(Product product) async {
    Map data = {
      'nama_produk': product.nama_produk,
      'harga_produk': product.harga,
    };

    final Response response = await post(Uri.parse(apiUrl),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(data));

    if (response.statusCode == 200) {
      return Product.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to create data');
    }
  }

  Future<Product> updateProduct(String id, Product product) async {
    Map data = {
      'nama_produk': product.nama_produk,
      'harga_produk': product.harga,
    };

    final Response response = await put(Uri.parse('$apiUrl/$id'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(data));

    if (response.statusCode == 200) {
      return Product.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to update data');
    }
  }

  Future<void> deleteProduct(String id) async {
    Response response = await delete(Uri.parse('$apiUrl/$id'));

    if (response.statusCode == 200) {
      return;
    } else {
      throw Exception('Failed to delete data');
    }
  }
}
