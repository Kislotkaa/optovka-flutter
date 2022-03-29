import 'dart:convert';

class Purchase {
  final String id;
  final String clientId;
  final double totalPrice;
  final String createAt;

  Purchase(
    this.id,
    this.clientId,
    this.totalPrice,
    this.createAt,
  );

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'id': id});
    result.addAll({'clientId': clientId});
    result.addAll({'totalPrice': totalPrice});
    result.addAll({'createAt': createAt});

    return result;
  }

  factory Purchase.fromMap(Map<String, dynamic> map) {
    return Purchase(
      map['id'] ?? '',
      map['clientId'] ?? '',
      map['totalPrice']?.toDouble() ?? 0.0,
      map['createAt'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory Purchase.fromJson(String source) =>
      Purchase.fromMap(json.decode(source));
}
