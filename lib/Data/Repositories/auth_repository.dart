import 'package:snappis/Core/Api/ApiServices.dart';
import 'package:snappis/Core/constant/Apiconstant.dart';
import 'package:snappis/Data/ResponseModel/authresponse.dart';


class AuthRepository {
  Future<AuthResponse> signup(Map<String, dynamic> body) async {
    final res = await ApiService.postAPI(ApiConstants.signup, body);

    // if (res["status"] != true) {
    //   throw res["message"] ?? "Signup failed";
    // }

    // final rawData = res["data"]["data"];

        print("FULL RESPONSE => $res");
final Map<String, dynamic> rawData =
    res["data"]["data"] as Map<String, dynamic>;

print("USER DATA ONLY => $rawData");

final Map<String, dynamic> userJson =
    res["data"]["data"]["user"] as Map<String, dynamic>;

final token = res["data"]["data"]["token"];


  /// 🔁 Normalize signup response to login-style response
  final normalizedResponse = {
    "status": res["status"],
    "status_code": res["status_code"],
    "message": res["message"],
    "data": {
      "token": token, // signup does not return token
      "user": userJson, // wrap user data properly
    }
  };
    

    return AuthResponse.fromJson(normalizedResponse);
  }

  Future<AuthResponse> login(Map<String, dynamic> body) async {
    final res = await ApiService.postAPI(ApiConstants.login, body);

         print("FULL RESPONSE => $res");
      final Map<String, dynamic> rawData =
    res["data"]["data"] as Map<String, dynamic>;

print("USER DATA ONLY => $rawData");

final Map<String, dynamic> userJson =
    res["data"]["data"]["user"] as Map<String, dynamic>;

final token = res["data"]["data"]["token"];


  /// 🔁 Normalize signup response to login-style response
  // ignore: unused_local_variable
  final normalizedResponse = {
    "status": res["status"],
    "status_code": res["status_code"],
    "message": res["message"],
    "data": {
      "token": token, // signup does not return token
      "user": userJson, // wrap user data properly
    }
  };

    return AuthResponse.fromJson(res["data"]);
  }
}
