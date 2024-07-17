// Represents a single item in the cart
class CartItemModel {
  int productId;
  int quantity;

  CartItemModel({required this.productId, required this.quantity});

  factory CartItemModel.fromMap(Map<String, dynamic> map) => CartItemModel(
        productId: map['productId'],
        quantity: map['quantity'],
      );
}
