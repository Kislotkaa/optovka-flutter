import 'dart:convert';

class PurchaseProduct {
  final String id;
  final String productId;
  final String purchaseId;
  final int quantity;

  PurchaseProduct(
    this.id,
    this.productId,
    this.purchaseId,
    this.quantity,
  );

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'id': id});
    result.addAll({'productId': productId});
    result.addAll({'purchaseId': purchaseId});
    result.addAll({'quantity': quantity});

    return result;
  }

  factory PurchaseProduct.fromMap(Map<String, dynamic> map) {
    return PurchaseProduct(
      map['id'] ?? '',
      map['productId'] ?? '',
      map['purchaseId'] ?? '',
      map['quantity']?.toInt() ?? 0,
    );
  }

  String toJson() => json.encode(toMap());

  factory PurchaseProduct.fromJson(String source) =>
      PurchaseProduct.fromMap(json.decode(source));
}
