import 'dart:convert';
import 'dart:math';

import 'package:ecommerce_app/models/cart.dart';
import 'package:http/http.dart' as http;

class CartRepo {
  static const String _url = 'https://fakestoreapi.com/carts';

  static Future<List<CartItemModel>> getAllCartItems() async {
    var uri = Uri.parse('$_url/1');
    final responce = await http.get(uri);

    if (responce.statusCode == 200) {
      final cartItemsMap = json.decode(responce.body) as Map<String, dynamic>;
      List<CartItemModel> cartItems = [];

      final productsList = cartItemsMap['products'] as List;

      for (var product in productsList) {
        cartItems.add(CartItemModel.fromMap(product as Map<String, dynamic>));
      }

      return cartItems;
    } else {
      throw Exception('failed to fetch cart');
    }
  }

  static Future<bool> addProductToCart(Map<String, dynamic> body) async {
    var uri = Uri.parse(_url);
    var responce = await http.post(uri, body: body);

    if (responce.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }
}
