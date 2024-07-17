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
            Hero(
              tag: product.id,
              child: Image.network(
                product.imageUrl,
                height: 125,
                width: double.infinity,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Text(
                maxLines: 2,
                product.title,
                style: const TextStyle(
                  overflow: TextOverflow.ellipsis,
                  fontSize: 12,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
