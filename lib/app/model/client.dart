import 'dart:convert';

class Client {
  final String id;
  late final String address;
  late final String phone;
  late final String name;
  late final String firstName;
  late final String lastName;

  Client(
    this.id,
    this.address,
    this.phone,
    this.name,
    this.firstName,
    this.lastName,
  );

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'id': id});
    result.addAll({'address': address});
    result.addAll({'phone': phone});
    result.addAll({'name': name});
    result.addAll({'firstName': firstName});
    result.addAll({'lastName': lastName});

    return result;
  }

  factory Client.fromMap(Map<String, dynamic> map) {
    return Client(
      map['id'] ?? '',
      map['address'] ?? '',
      map['phone'] ?? '',
      map['name'] ?? '',
      map['firstName'] ?? '',
      map['lastName'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory Client.fromJson(String source) => Client.fromMap(json.decode(source));
}
