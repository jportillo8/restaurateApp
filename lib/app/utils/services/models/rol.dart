import 'dart:convert';

class Rol {
  Rol({
    this.id,
    this.name,
    this.image,
    this.route,
  });

  final String? id;
  final String? name;
  final String? image;
  final String? route;

  factory Rol.fromJson(String str) => Rol.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Rol.fromMap(Map<String, dynamic> json) => Rol(
        id: json["id"].toString(),
        name: json["name"],
        image: json["image"],
        route: json["route"],
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "name": name,
        "image": image,
        "route": route,
      };
}
