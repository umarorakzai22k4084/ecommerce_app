import 'package:ecommerce_app/models/products.dart';
import 'package:flutter/material.dart';

class ProductDetailsScreen extends StatelessWidget {
  final ProductModel product;
  const ProductDetailsScreen({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          product.title,
          style: const TextStyle(overflow: TextOverflow.ellipsis),
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.all(8),
        children: [
          Hero(
            tag: product.id,
            child: Image.network(
              product.imageUrl,
              height: 300,
              width: double.infinity,
            ),
          ),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      product.title,
                      style: const TextStyle(
                        overflow: TextOverflow.clip,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      product.category,
                      style: const TextStyle(fontSize: 12),
                    ),
                  ],
                ),
              ),
              Text(
                '\$${product.price}',
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Text(product.description),
          const SizedBox(height: 16),
          Center(
            child: ElevatedButton(
              style: const ButtonStyle(
                backgroundColor: WidgetStatePropertyAll(Colors.yellow),
              ),
              onPressed: () {},
              child: const Text('Add to Cart'),
            ),
          )
        ],
      ),
    );
  }
}
