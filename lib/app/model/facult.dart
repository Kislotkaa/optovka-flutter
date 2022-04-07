import 'dart:convert';

class Facult {
  final String id;
  final String name;
  final String description;
  final String lekci;
  final String practic;
  final String laboratory;

  Facult(
    this.id,
    this.name,
    this.description,
    this.lekci,
    this.practic,
    this.laboratory,
  );

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'id': id});
    result.addAll({'name': name});
    result.addAll({'description': description});
    result.addAll({'lekci': lekci});
    result.addAll({'practic': practic});
    result.addAll({'laboratory': laboratory});

    return result;
  }

  factory Facult.fromMap(Map<String, dynamic> map) {
    return Facult(
      map['id'] ?? '',
      map['name'] ?? '',
      map['description'] ?? '',
      map['lekci'] ?? '',
      map['practic'] ?? '',
      map['laboratory'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory Facult.fromJson(String source) => Facult.fromMap(json.decode(source));
}
