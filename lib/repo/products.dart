import 'dart:async';
import 'dart:convert';

import 'package:ecommerce_app/models/product.dart';
import 'package:http/http.dart' as http;

class ProductsRepo {
  static const String _url = 'https://fakestoreapi.com/products';

  static Future<List<ProductModel>> getAllProducts() async {
    final uri = Uri.parse(_url);
    final responce = await http.get(uri);

    if (responce.statusCode == 200) {
      final productsMapList = json.decode(responce.body) as List<dynamic>;
      List<ProductModel> products = [];

      for (var productsMap in productsMapList) {
        products.add(ProductModel.fromMap(productsMap));
      }

      return products;
    } else {
      throw Exception('failed to fetch products');
    }
  }

  static Future<ProductModel> getProduct(int id) async {
    final uri = Uri.parse('$_url/$id');
    final responce = await http.get(uri);

    if (responce.statusCode == 200) {
      final productMap = json.decode(responce.body) as Map<String, dynamic>;
      ProductModel product = ProductModel.fromMap(productMap);

      return product;
    } else {
      throw Exception('failed to fetch the product');
    }
  }
}
