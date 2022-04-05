import 'dart:convert';

class Client {
  late String id;
  final String organization;
  final String address;
  final String phone;

  Client(
    this.id,
    this.organization,
    this.address,
    this.phone,
  );

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'id': id});
    result.addAll({'organization': organization});
    result.addAll({'address': address});
    result.addAll({'phone': phone});

    return result;
  }

  factory Client.fromMap(Map<String, dynamic> map) {
    return Client(
      map['id'] ?? '',
      map['organization'] ?? '',
      map['address'] ?? '',
      map['phone'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory Client.fromJson(String source) => Client.fromMap(json.decode(source));
}
