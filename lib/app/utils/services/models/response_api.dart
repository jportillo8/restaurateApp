import 'dart:convert';

class ResponseApi {
  final bool? success;
  final String? message;
  final dynamic data;

  ResponseApi({this.success, this.message, this.data});

  factory ResponseApi.fromJson(String str) =>
      ResponseApi.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory ResponseApi.fromMap(Map<String, dynamic> json) => ResponseApi(
        success: json["success"],
        message: json["message"],
        data: json["data"],
      );

  Map<String, dynamic> toMap() => {
        "success": success,
        "message": message,
        "data": data,
      };
}
