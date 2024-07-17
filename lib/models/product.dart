class ProductModel {
  final int id;
  final String title;
  final num price;
  final String category;
  final String description;
  final String imageUrl;

  ProductModel({
    required this.id,
    required this.title,
    required this.price,
    required this.category,
    required this.description,
    required this.imageUrl,
  });

  factory ProductModel.fromMap(Map<String, dynamic> map) => ProductModel(
        id: map['id'],
        title: map['title'],
        price: map['price'],
        category: map['category'],
        description: map['description'],
        imageUrl: map['image'],
      );
}
