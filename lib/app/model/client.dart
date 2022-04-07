import 'dart:convert';

class Client {
  final String id;
  final String address;
  final String phone;
  final String name;
  final String firstName;
  final String lastName;

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
