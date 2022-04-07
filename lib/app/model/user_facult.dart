import 'dart:convert';

import 'facult.dart';

class UserFacult {
  final Facult product;
  late int grade;

  UserFacult(
    this.product,
    this.grade,
  );

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'facult': product.toMap()});
    result.addAll({'grade': grade});

    return result;
  }

  factory UserFacult.fromMap(Map<String, dynamic> map) {
    return UserFacult(
      Facult.fromMap(map['product']),
      map['grade']?.toInt() ?? 0,
    );
  }

  String toJson() => json.encode(toMap());

  factory UserFacult.fromJson(String source) =>
      UserFacult.fromMap(json.decode(source));
}
