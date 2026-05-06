import 'package:snappis/Data/ResponseModel/authdata.dart';

class AuthResponse {
  final String status;
  final int statusCode;
  final String message;
  final AuthData? data;

  AuthResponse({
    required this.status,
    required this.statusCode,
    required this.message,
    this.data,
  });

  // factory AuthResponse.fromJson(Map<String, dynamic> json) {
  //   return AuthResponse(
  //     status: json["status"] ?? "",
  //     statusCode: json["status_code"] ?? 0,
  //     message: json["message"] ?? "",
  //     data: json["data"] != null ? AuthData.fromJson(json["data"]) : null,
  //   );
  // }

  factory AuthResponse.fromJson(Map<String, dynamic> json) {
  return AuthResponse(
    status: json["status"] is bool
        ? (json["status"] ? "success" : "failed")
        : json["status"]?.toString() ?? "",

    statusCode: json["status_code"] ?? 0,
    message: json["message"]?.toString() ?? "",
    data: json["data"] != null ? AuthData.fromJson(json["data"]) : null,
  );
}
}
