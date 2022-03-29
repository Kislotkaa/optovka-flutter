import 'dart:convert';

import 'package:optovka/app/model/product.dart';

class ProductOrder {
  final Product product;
  late int quantity;

  ProductOrder(
    this.product,
    this.quantity,
  );

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'product': product.toMap()});
    result.addAll({'quantity': quantity});

    return result;
  }

  factory ProductOrder.fromMap(Map<String, dynamic> map) {
    return ProductOrder(
      Product.fromMap(map['product']),
      map['quantity']?.toInt() ?? 0,
    );
  }

  String toJson() => json.encode(toMap());

  factory ProductOrder.fromJson(String source) =>
      ProductOrder.fromMap(json.decode(source));
}
