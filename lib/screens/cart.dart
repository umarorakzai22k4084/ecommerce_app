import 'dart:developer';

import 'package:ecommerce_app/repo/cart.dart';
import 'package:flutter/material.dart';
import 'package:ecommerce_app/models/cart.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  List<CartItemModel> cartItems = [];
  bool isLoading = false, isError = false;

  @override
  void initState() {
    super.initState();
    setState(() {
      isLoading = true;
    });

    CartRepo.getAllCartItems().then((result) {
      setState(() {
        cartItems = result;
        isLoading = false;
      });
    }).catchError((err) {
      log(err.toString());
      setState(() {
        isLoading = false;
        isError = true;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    //Loading case
    Widget content = const Center(
      child: CircularProgressIndicator(),
    );

    if (isError) {
      content = const Center(
        child: Text('failed to fetch cart items!'),
      );
    }

    if (!isLoading && !isError) {
      content = ListView.builder(
        itemCount: cartItems.length,
        itemBuilder: (context, index) {
          return const Placeholder();
        },
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Cart'),
      ),
      body: content,
    );
  }
}
