import 'package:ecommerce_app/components/product_item.dart';
import 'package:ecommerce_app/repo/products.dart';
import 'package:ecommerce_app/screens/cart.dart';
import 'package:flutter/material.dart';
import 'package:ecommerce_app/models/product.dart';

class ProductsScreen extends StatefulWidget {
  const ProductsScreen({super.key});

  @override
  State<ProductsScreen> createState() => _ProductsScreenState();
}

class _ProductsScreenState extends State<ProductsScreen> {
  List<ProductModel> products = [];
  bool isLoading = false, isError = false;

  @override
  void initState() {
    super.initState();

    setState(() {
      isLoading = true;
    });

    ProductsRepo.getAllProducts().then(
      (value) {
        setState(() {
          products = value;
          isLoading = false;
        });
      },
    ).catchError((err) {
      setState(() {
        isError = true;
        isLoading = false;
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
        child: Text('Error loading Products!'),
      );
    }

    if (!isLoading && !isError) {
      content = GridView.builder(
        padding: const EdgeInsets.only(bottom: 32),
        itemCount: products.length,
        gridDelegate:
            const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        itemBuilder: (context, index) {
          return ProductItem(
            product: products[index],
            key: Key(products[index].id.toString()),
          );
        },
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Product Screen'),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => CartScreen(),
              ));
            },
            icon: const Icon(Icons.shopping_basket_outlined),
          )
        ],
      ),
      body: content,
    );
  }
}
