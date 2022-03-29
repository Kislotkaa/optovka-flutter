import 'dart:convert';

class Product {
  final String id;
  final String url;
  final String name;
  final String description;
  final String countStr;
  final double price;

  Product(
    this.id,
    this.url,
    this.name,
    this.description,
    this.countStr,
    this.price,
  );

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'id': id});
    result.addAll({'url': url});
    result.addAll({'name': name});
    result.addAll({'description': description});
    result.addAll({'countStr': countStr});
    result.addAll({'price': price});

    return result;
  }

  factory Product.fromMap(Map<String, dynamic> map) {
    return Product(
      map['id'] ?? '',
      map['url'] ?? '',
      map['name'] ?? '',
      map['description'] ?? '',
      map['countStr'] ?? '',
      map['price']?.toDouble() ?? 0.0,
    );
  }

  String toJson() => json.encode(toMap());

  factory Product.fromJson(String source) =>
      Product.fromMap(json.decode(source));
}
