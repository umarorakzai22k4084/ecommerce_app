import 'dart:convert';

import 'package:ecommerce_app/models/cart.dart';
import 'package:http/http.dart' as http;

class CartRepo {
  static const String _url = 'https://fakestoreapi.com/carts/1';

  static Future<List<CartItemModel>> getAllCartItems() async {
    var uri = Uri.parse(_url);
    final responce = await http.get(uri);

    if (responce.statusCode == 200) {
      final cartItemsMap = json.decode(responce.body) as Map<String, dynamic>;
      List<CartItemModel> cartItems = [];

      final productsList =
          cartItemsMap['products'] as List<Map<String, dynamic>>;

      for (var product in productsList) {
        cartItems.add(CartItemModel.fromMap(product));
      }

      return cartItems;
    } else {
      throw Exception('failed to fetch cart');
    }
  }
}
