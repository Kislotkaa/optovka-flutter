import 'dart:convert';

import 'client.dart';

class ClientFacult {
  final Client client;
  final int grade;

  ClientFacult(this.client, this.grade);

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'client': client.toMap()});
    result.addAll({'grade': grade});

    return result;
  }

  factory ClientFacult.fromMap(Map<String, dynamic> map) {
    return ClientFacult(
      Client.fromMap(map['client']),
      map['grade']?.toInt() ?? 0,
    );
  }

  String toJson() => json.encode(toMap());

  factory ClientFacult.fromJson(String source) =>
      ClientFacult.fromMap(json.decode(source));
}
