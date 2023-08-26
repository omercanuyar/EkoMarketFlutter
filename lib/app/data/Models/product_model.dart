class Product {
  int id;
  int categoryId;
  String name;
  String? explanation;
  String? imageUrl;

  Product({
    required this.id,
    required this.categoryId,
    required this.name,
    this.explanation,
    this.imageUrl,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['Id'] as int,
      categoryId: json['CategoryId'] as int,
      name: json['Name'] as String,
      explanation: json['Explanation'] as String?,
      imageUrl: json['Imageurl'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['Id'] = id;
    data['CategoryId'] = categoryId;
    data['Name'] = name;
    data['Explanation'] = explanation;
    data['Imageurl'] = imageUrl;
    return data;
  }
}
