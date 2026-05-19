import 'dart:async';

import 'package:get/get.dart';
import 'package:snappis/Core/Api/ApiServices.dart';
import 'package:snappis/Core/constant/Apiconstant.dart';
import 'package:snappis/Data/ResponseModel/userModel.dart';
import 'package:snappis/Domains/helper/validation.dart';
import 'package:snappis/Presentation/Binding/instagrambinding.dart';
import 'package:snappis/Presentation/Screens/Admin/Admin_Dashboard.dart';
import 'package:snappis/Presentation/Screens/Change_pwd/Change_password.dart';
import 'package:snappis/Presentation/Screens/Creator/ReelsApp/creator_reels_main.dart';
import 'package:snappis/Presentation/Screens/Forgot_password/OTpSc.dart';
import 'package:snappis/Presentation/Screens/User_type_screen.dart';
import '../../Data/Repositories/auth_repository.dart';

class AuthController extends GetxController {
  final AuthRepository _repo = AuthRepository();

  final isLoading = false.obs;
  final Rx<UserModel?> user = Rx<UserModel?>(null);
  final token = "".obs;

  /// Form fields
  final nameCtrl = "".obs;
  final phoneCtrl = "".obs;
  final emailCtrl = "".obs;
  final passwordCtrl = "".obs;
  final countryid = "".obs;


  // forgot password response
  RxString forgotUserId = "".obs;
  RxInt forgotOtp = 0.obs;

  RxString newPassword = "".obs;
  RxString confirmPassword = "".obs;


    // OTP timer
  RxInt otpSeconds = 60.obs;
  RxBool canResendOtp = false.obs;
final userId = "".obs;

  Timer? _otpTimer;

  void startOtpTimer() {
  otpSeconds.value = 60;
  canResendOtp.value = false;

  _otpTimer?.cancel();

  _otpTimer = Timer.periodic(const Duration(seconds: 1), (timer) {
    if (otpSeconds.value == 0) {
      canResendOtp.value = true;
      timer.cancel();
    } else {
      otpSeconds.value--;
    }
  });
}

Future<void> resendOtp() async {
  if (!canResendOtp.value) return;

  await forgotPassword();
}



  Future<void> signup() async {
    isLoading.value = true;

    try {
      // Bypassing API for testing
      await Future.delayed(const Duration(seconds: 1));
      _navigateByRole(3); // Direct navigation as Brand

      /*
      final body = {
        "name": nameCtrl.value,
        "first_name": nameCtrl.value.split(" ").first,
        "last_name": nameCtrl.value.split(" ").length > 1
            ? nameCtrl.value.split(" ").last
            : "",
        "country_code_id": 1,
        "mobile_number": phoneCtrl.value,
        "email": emailCtrl.value,
        "password": passwordCtrl.value,
        "rtype_id": 3, // signup role
      };

      final res = await _repo.signup(body);

      final roleId = res.data!.user!.rtypeId;
      user.value = res.data!.user;

      token.value = res.data?.token ?? "";
      userId.value = res.data?.user?.userId ?? ""; // 👈 ADD THIS

      print("USER => ${user.value}");
      print("ROLE ID => $roleId");

      _navigateByRole(roleId);
      */

    } catch (e) {
      Get.snackbar("Signup Failed", e.toString());
    } finally {
      isLoading.value = false;
    }
  }


  Future<void> Csignup() async {
    isLoading.value = true;

    try {
      await Future.delayed(const Duration(seconds: 1));
      _navigateByRole(2); 
      /*
      final body = {
        "name": nameCtrl.value,
        "first_name": nameCtrl.value.split(" ").first,
        "last_name": nameCtrl.value.split(" ").length > 1
            ? nameCtrl.value.split(" ").last
            : "",
        "country_code_id": countryid.value,
        "mobile_number": phoneCtrl.value,
        "email": emailCtrl.value,
        "password": passwordCtrl.value,
        "rtype_id": 2, // signup role
      };

      final res = await _repo.signup(body);

      user.value = res.data?.user;
      print("user: ${user.value}");

      token.value = res.data?.token ?? "";
      userId.value = res.data?.user?.userId ?? ""; 
      token.value = res.data?.token ?? "";

      _navigateByRole(user.value?.rtypeId);
      */

    } catch (e) {
      Get.snackbar("Signup Failed", e.toString());
    } finally {
      isLoading.value = false;
    }
  }

Future<void> login() async {
    isLoading.value = true;

    try {
      final body = {
        "login": emailCtrl.value,
        "password": passwordCtrl.value,
      };

      // final res = await _repo.login(body);
         final res = await _repo.login(body);

        final roleId = res.data!.user!.rtypeId;
        userId.value = res.data!.user!.userId;

              user.value = res.data!.user;


      // final roleId = res["data"]["data"]["user"]["rtype_id"];
      // print("ROLE ID RAW => $roleId");


      print("ROLE ID => $roleId");
      print("User ID => ${userId.value}");
      _navigateByRole(roleId);


    } catch (e) {
      Get.snackbar("Signup Failed", e.toString());
    } finally {
      isLoading.value = false;
    }
  }

  /// 🔐 Central role-based navigation
  /// 
  void _navigateByRole(int? rtypeId) {
  if (rtypeId == null) return;

  if (rtypeId == 1) {
    Get.offAll(() => const Admindashboard(), binding: InstagramCategoryBinding());
  } else if (rtypeId == 2) {
    Get.offAll(() => const CreatorReelsMain());
  } else if (rtypeId == 3) {
    Get.offAllNamed('/Brand-Home');
  } else {
    Get.snackbar("Error", "Invalid user role");
  }
}

Future<void> forgotPassword() async {
  try {
    isLoading.value = true;

    final input = emailCtrl.value.trim();

    String email = "";
    String phone = "";

    if (isEmail(input)) {
      email = input;
    } else if (isPhone(input)) {
      phone = input;
    } else {
      Get.snackbar(
        "Invalid Input",
        "Please enter a valid email or phone number",
        snackPosition: SnackPosition.BOTTOM,
      );
      return;
    }

    final body = {
      "email": email,
      "phone": phone,
    };

    final res = await ApiService.postAPI(
      ApiConstants.forgotPassword,
      body,
    );

    print(res["status"]);


    if (res["status"] is bool)
    {
      if (res["status"] != true) {
            print("mandeep");
            Get.snackbar("Error", res["message"]);
            return;
          }
    }
    
      print("step 1");

    // ✅ Save OTP session
    forgotUserId.value = res["data"]["data"]["user_id"];
    forgotOtp.value = res["data"]["data"]["otp"];
      print("step 2");


    // ✅ Start timer
    startOtpTimer();

    // ✅ Snackbar
    Get.snackbar(
      "Success",
      res["data"]["message"],
      snackPosition: SnackPosition.BOTTOM,
    );

    // ✅ Navigate to OTP screen
    Get.to(() => const Otpsc());

  } catch (e) {
    print("Test");
    Get.snackbar("Error", e.toString());
  } finally {
    isLoading.value = false;
  }
}

Future<void> verifyForgotPasswordOtp(int otp) async {
  try {
    isLoading.value = true;

    final body = {
      "user_id": forgotUserId.value, // saved during forgot-password
      "otp": otp,
    };

    final res = await ApiService.postAPI(
      ApiConstants.verifyForgotPasswordOtp,
      body,
    );

    if (res["status"] is bool)
    {
                    print("Mandeep ${res["status"]}");

      if (res["status"] != true) {
          
          Get.snackbar(
        "Invalid OTP",
        res["message"] ?? "OTP verification failed",
        snackPosition: SnackPosition.BOTTOM,
      );
      return;

      }
    }


    // ✅ OTP verified successfully
    Get.snackbar(
      "Success",
      res["message"] ?? "OTP verified",
      snackPosition: SnackPosition.BOTTOM,
    );

    // 👉 Navigate to Change Password screen
    Get.to(() => const ChangePassword());

  } catch (e) {
    Get.snackbar(
      "Error",
      e.toString(),
      snackPosition: SnackPosition.BOTTOM,
    );
  } finally {
    isLoading.value = false;
  }
}

/// 🔐 Change Password API
  Future<void> changePassword() async {
    if (newPassword.value.isEmpty || confirmPassword.value.isEmpty) {
      Get.snackbar("Error", "All fields are required");
      return;
    }

    if (newPassword.value != confirmPassword.value) {
      Get.snackbar("Error", "Passwords do not match");
      return;
    }

    if (newPassword.value.length < 8) {
      Get.snackbar(
        "Weak Password",
        "Password must be at least 8 characters",
      );
      return;
    }

    try {
      isLoading.value = true;

      final body = {
        "user_id": forgotUserId.value, // from OTP verification flow
        "new_password": newPassword.value,
      };

      final res = await ApiService.postAPI(
        ApiConstants.resetpassword,
        body,
      );

      // if (res["status"] != "success") {
      //   print(res["status"]);
      //   Get.snackbar("Error", res["message"]);
      //   return;
      // }
        if (res["status"] is bool)
    {
                    print("Mandeep ${res["status"]}");

      if (res["status"] != true) {
          
          Get.snackbar(
        "Invalid OTP",
        res["message"] ?? "OTP verification failed",
        snackPosition: SnackPosition.BOTTOM,
      );
      return;

      }
    }



      Get.snackbar(
        "Success",
        "Password changed successfully",
      );

      // 🔁 Go to Login screen
      Get.offAll(() => const UserTypeScreen());

    } catch (e) {
      Get.snackbar("Error", e.toString());
    } finally {
      isLoading.value = false;
    }
  }

  // void _navigateByRole(int? rtypeId) {
  //   print(rtypeId);
  //   switch (rtypeId) {
  //     case 1:
  //       Get.offAllNamed("/admin-dashboard");
  //       break;
  //     case 2:
  //       Get.offAllNamed("/brand-dashboard");
  //       break;
  //     case 3:
  //       print("brand");
  //       Get.offAllNamed("/brand-dashboard");
  //       break;
  //     default:
  //       Get.snackbar(
  //         "Access Error",
  //         "Invalid user role. Please contact support.",
  //       );
  //   }
  // }
}
