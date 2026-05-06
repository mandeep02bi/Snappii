// import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
// import 'package:device_info_plus/device_info_plus.dart';
// import 'package:package_info_plus/package_info_plus.dart';

class ApiConstants {

  static String AESKey = "IEMSRajasthanJaipurIdeaInfinity2";
  static String strIV = "Man";

  static var authToken = "";
   static Future<void> saveToken(String token) async {
    authToken = token;
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('token', token);
  }


  static Future<String?> getToken() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString('token');
  }

    static Future<Map<String, String>> getHeaders(String headersType) async {
    final tokens = await getToken() ?? "";

    switch(headersType){
      case "1":
        var headers = {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer ${tokens}',
        };
        return headers;
      default:
        var defaultHeaders = {
          'Content-Type': 'application/json',
          'Authorization': '',
        };
        return defaultHeaders;
    }
  }
  static const String baseUrl = "http://192.168.64.156:8000/"; 
    // static const String baseUrl = "http://192.168.128.156:8000/";
  static const String countryCodes = "api/admin/country-phone-codes";

  static const String signup = "api/auth/signup";
  static const String forgotPassword = "api/auth/forgot-password";
  static const String verifyOtp = "/auth/verify-otp";
  static const String changePassword = "api/auth/change-password";
  static const String resetpassword = "api/auth/reset-password";
  static const String sendOtp = "/auth/send-otp";
  static const String login = "api/auth/login";
  static const String verifyForgotPasswordOtp = "api/auth/verify-forgot-password-otp";

  static const String categories = "api/instagram-categories";
  static const String addcategories = "api/instagram-category";
  

  static const String getcategories = "api/instagram-categories";
  static const String getgender = "api/admin/genders/list";


  static const String creatorprofile = "api/creator/profile";





  static var receiveTimeout = const Duration(milliseconds: 250000);
  static var sendTimeout = const Duration(milliseconds: 250000);

  static var receiveTimeout2 = const Duration(milliseconds: 60000);
  static var sendTimeout2 = const Duration(milliseconds: 60000);
}
