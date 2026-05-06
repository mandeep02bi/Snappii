
import 'package:snappis/Core/Api/ApiServices.dart';
import 'package:snappis/Core/constant/Apiconstant.dart';
import 'package:snappis/Domains/controllers/authcontroller.dart';
import 'package:url_launcher/url_launcher.dart';


import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_web_auth_2/flutter_web_auth_2.dart';
import 'package:get/get.dart';
import 'package:snappis/Core/utils/Colors.dart';
import 'package:snappis/Presentation/Controllers/Creator_controller.dart';
import 'package:snappis/Presentation/Widgets/Info_tile.dart';
import 'package:snappis/Presentation/Widgets/SecPrimar_btn.dart';

class Connectinsta2 extends StatefulWidget {
  const Connectinsta2({super.key});

  @override
  State<Connectinsta2> createState() => _Connectinsta2State();
}

class _Connectinsta2State extends State<Connectinsta2> {
  final CreatorController controller = Get.find();


  Future<void> _connectInstagram() async {
  try {
    Get.dialog(
      const Center(child: CircularProgressIndicator()),
      barrierDismissible: false,
    );

    const clientId = "4051477838476254";
    var redirectUri = "";
    if (kIsWeb) {
        redirectUri= "${ApiConstants.baseUrl}api/instagram/auth/callback";
      } else {
        redirectUri = "snappis://auth";
      }


    // final authUrl =
    //     "https://api.instagram.com/oauth/authorize"
    //     "?client_id=$clientId"
    //     "&redirect_uri=$redirectUri"
    //     "&scope=public_profile,email,instagram_basic,pages_show_list,instagram_manage_insights"
    //     "&response_type=code";

      final authUrl =
      "https://www.facebook.com/v18.0/dialog/oauth"
      "?client_id=$clientId"
      "&redirect_uri=$redirectUri"
      "&scope=public_profile,email,instagram_basic,pages_show_list,instagram_manage_insights"
      "&response_type=code";

  if (kIsWeb) {
      Get.back();
      // html.window.location.href = authUrl;
      final uri = Uri.parse(authUrl);
      await launchUrl(uri, webOnlyWindowName: "_self");
      return;
    }
    final result = await FlutterWebAuth2.authenticate(
      url: authUrl,
      callbackUrlScheme: "snappis",
    );

    final code = Uri.parse(result).queryParameters['code'];

    if (code != null) {
       await _sendCodeToBackend(code);

      // final response = await Dio().post(
      //   "https://yourbackend.com/api/instagram/connect",
      //   data: {
      //     "code": code,
      //     "user_id": "LOGGED_IN_USER_ID"
      //   },
      // );

      Get.back(); // close loader

      // if (response.data["success"] == true) {
        Get.dialog(
          AlertDialog(
            title: const Text("Instagram Connected"),
            content: const Text("Your account has been verified successfully."),
            actions: [
              TextButton(
                onPressed: () {
                  Get.back();
                  // Get.offAllNamed("/home");
                },
                child: const Text("Continue"),
              )
            ],
          ),
        );
      // }
    }
  } catch (e) {
    Get.back();
    Get.snackbar("Error", "Instagram connection failed");
  }
}



Future<void> _sendCodeToBackend(String code) async {
  try {
        final AuthController authController = Get.find();

    Get.dialog(
      const Center(child: CircularProgressIndicator()),
      barrierDismissible: false,
    );

    final response = await ApiService.postAPI(
      "api/instagram/connect", // 👈 only endpoint
      {
        "code": code,
        "user_id": authController.userId.value,
      },
    );


    Get.back(); // Close loader

    if (response.statusCode == 200 &&
        response.data["status"] == "success") {

      Get.dialog(
        AlertDialog(
          title: const Text("Instagram Connected"),
          content: const Text(
              "Your account has been verified successfully."),
          actions: [
            TextButton(
              onPressed: () {
                Get.back();
                // Navigate to next screen if needed
                // Get.offAllNamed("/home");
              },
              child: const Text("Continue"),
            )
          ],
        ),
      );
    } else {
      Get.snackbar(
        "Connection Failed",
        response.data["message"] ?? "Something went wrong",
      );
    }
  } catch (e) {
    Get.back();

    Get.snackbar(
      "Error",
      "Backend connection failed. Please try again.",
    );
  }
}



  @override
  Widget build(BuildContext context) {
    final w = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: AppColors.bg,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              /// Back button (WORKING)
              Align(
                alignment: Alignment.centerLeft,
                child: IconButton(
                  icon: const Icon(Icons.arrow_back),
                  onPressed: () => Navigator.pop(context),
                ),
              ),

              const SizedBox(height: 4),

              /// Title
              const Text(
                "Connect with\nInstagram",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.w700,
                  color: AppColors.primary,
                ),
              ),

              const SizedBox(height: 6),

              const Text(
                "Secured with Meta APIs",
                style: TextStyle(fontSize: 14, color: AppColors.muted),
              ),

              const SizedBox(height: 28),

              /// Instagram logo
              Image.asset(
                "assets/instagram.png", // add to pubspec.yaml
                width: w * 0.45,
              ),

              const SizedBox(height: 28),

              /// Info tiles
              const InfoTile(
                bg: AppColors.infoBlue,
                icon: Icons.check_circle,
                iconColor: Colors.blue,
                text:
                    "Build instant trust with top brands and unlock high-value collaborations.",
              ),

              const SizedBox(height: 12),

              const InfoTile(
                bg: AppColors.infoGrey,
                icon: Icons.trending_up,
                iconColor: Colors.black54,
                text:
                    "Increase your chances of getting selected with verified performance insights.",
              ),

              const SizedBox(height: 12),

              const InfoTile(
                bg: AppColors.infoGreen,
                icon: Icons.verified,
                iconColor: Colors.green,
                text:
                    "We never access your password or private chats — your data is 100% secure and fully encrypted.",
              ),

              const Spacer(),

              /// CTA
              SecprimarBtn(
                text: "Connect instagram",
                 onPressed: () async {
                  await _connectInstagram();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}