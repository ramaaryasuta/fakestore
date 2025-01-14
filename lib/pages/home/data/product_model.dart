class Product {
  int id;
  String title;
  num price;
  String category;
  String description;
  String imageUrl;

  Product(
      {required this.id,
      required this.title,
      required this.price,
      required this.category,
      required this.description,
      required this.imageUrl});

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'],
      title: json['title'],
      price: json['price'],
      category: json['category'],
      description: json['description'],
      imageUrl: json['image'],
    );
  }
}
