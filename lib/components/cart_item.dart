import 'package:ecommerce_app/models/cart.dart';
import 'package:ecommerce_app/models/product.dart';
import 'package:ecommerce_app/repo/products.dart';
import 'package:flutter/material.dart';

class CartItem extends StatefulWidget {
  final CartItemModel cartItem;
  const CartItem({super.key, required this.cartItem});

  @override
  State<CartItem> createState() => _CartItemState();
}

class _CartItemState extends State<CartItem> {
  late ProductModel product;
  bool isLoading = false, isError = false;

  @override
  void initState() {
    super.initState();
    setState(() {
      isLoading = true;
    });

    ProductsRepo.getProduct(widget.cartItem.productId).then((result) {
      setState(() {
        product = result;
        isLoading = false;
      });
    }).catchError((err) {
      setState(() {
        isError = true;
        isLoading = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget content = const Center(child: CircularProgressIndicator());

    if (isError) {
      content = const Center(child: Text('failed to fetch cart item'));
    }

    if (!isLoading && !isError) {
      content = Row(
        children: [
          Image.network(
            product.imageUrl,
            height: 70,
            width: 70,
          ),
          const SizedBox(width: 5),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  product.title,
                  overflow: TextOverflow.ellipsis,
                ),
                Text('\$${product.price}'),
              ],
            ),
          ),
          Column(
            children: [
              Text(widget.cartItem.quantity.toString()),
              Row(
                children: [
                  IconButton(
                    style: ButtonStyle(
                      backgroundColor: WidgetStatePropertyAll(
                        Theme.of(context).colorScheme.primaryContainer,
                      ),
                    ),
                    onPressed: () {},
                    icon: const Icon(Icons.add),
                  ),
                  IconButton(
                    style: ButtonStyle(
                      backgroundColor: WidgetStatePropertyAll(
                        Theme.of(context).colorScheme.primaryContainer,
                      ),
                    ),
                    onPressed: () {},
                    icon: const Icon(Icons.remove),
                  )
                ],
              )
            ],
          )
        ],
      );
    }

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 4, vertical: 12),
      child: content,
    );
  }
}
