import 'package:ecommerce_app/models/products.dart';
import 'package:ecommerce_app/screens/product_details.dart';
import 'package:flutter/material.dart';

class ProductItem extends StatelessWidget {
  final ProductModel product;
  const ProductItem({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => ProductDetailsScreen(
              product: product,
            ),
          ),
        );
      },
      child: Card(
        color: Colors.white,
        child: Column(
          children: [
            Image.network(
              product.imageUrl,
              height: 130,
              width: double.infinity,
            ),
            Text(
              product.title,
              style: const TextStyle(overflow: TextOverflow.ellipsis),
            ),
          ],
        ),
      ),
    );
  }
}
