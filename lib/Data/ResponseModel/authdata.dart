import 'package:snappis/Data/ResponseModel/userModel.dart';

class AuthData {
  final String? token;
  final UserModel? user;

  AuthData({this.token, this.user});

  factory AuthData.fromJson(Map<String, dynamic> json) {
    return AuthData(
      token: json["token"],
      user: json["user"] != null ? UserModel.fromJson(json["user"]) : null,
    );
  }
}
