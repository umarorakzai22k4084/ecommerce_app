import 'dart:convert';

import 'package:ecommerce_app/models/products.dart';
import 'package:http/http.dart' as http;

class ProductsRepo {
  static const String _url = 'https://fakestoreapi.com/products';

  static Future<List<ProductModel>?> getAllProducts() async {
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
      return null;
    }
  }
}
