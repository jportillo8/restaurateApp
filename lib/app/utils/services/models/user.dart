// To parse this JSON data, do
//
//     final user = userFromJson(jsonString);

import 'dart:convert';

import 'package:dev9lu_market_flutter/app/utils/services/models/rol.dart';

User userFromJson(String str) => User.fromJson(json.decode(str));

String userToJson(User data) => json.encode(data.toJson());

class User {
  String? id;
  String? email;
  String? name;
  String? phone;
  String? image;
  String? password;
  String? sessionToken;
  List<Rol>? roles = [];

  User(
      {this.id,
      this.email,
      this.name,
      this.phone,
      this.image,
      this.password,
      this.sessionToken,
      this.roles});

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["id"],
        email: json["email"],
        name: json["name"],
        phone: json["phone"],
        image: json["image"],
        password: json["password"],
        sessionToken: json["session"],
        roles: json["roles"] == null
            ? []
            : List<Rol>.from(json["roles"].map((model) => Rol.fromMap(model))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "email": email,
        "name": name,
        "phone": phone,
        "image": image,
        "password": password,
        "session": sessionToken,
        "roles": roles,
      };
}
