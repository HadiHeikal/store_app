class ProductModel {
  final String id;
  final String title;
  final String description;
  final String images;
  final double price;
  final double rating;

  ProductModel({
    required this.id,
    required this.title,
    required this.description,
    required this.images,
    required this.price,
    required this.rating,
  });

  // factory method to create a ProductModel from JSON
  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      id: json['id'],
      title: json['title'],
      description: json['description'],
      images: json['images'][0],
      price: json['price'],
      rating: json['rating'],
    );
  }
}
