import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sms_autofill/sms_autofill.dart';
import 'package:snappis/Domains/controllers/authcontroller.dart';

class Otpsc extends StatefulWidget {
  const Otpsc({super.key});

  @override
  State<Otpsc> createState() => _OtpscState();
}

class _OtpscState extends State<Otpsc> {
  String otpCode = "";


  @override
  void initState() {
    super.initState();
    listenForOTP();
  }

  Future<void> listenForOTP() async {
    await SmsAutoFill().listenForCode();
  }

   void verifyOtp(AuthController auth) {
    if (otpCode.length != 6) {
      Get.snackbar(
        "Invalid OTP",
        "Please enter a valid 6-digit OTP",
        snackPosition: SnackPosition.BOTTOM,
      );
      return;
    }

    auth.verifyForgotPasswordOtp(int.parse(otpCode));
  }



  @override
  Widget build(BuildContext context) {
    final AuthController auth = Get.find<AuthController>();

    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: width * 0.08),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: height * 0.10),

              const Text(
                "Verify Code",
                style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
              ),

              const SizedBox(height: 6),

              const Text(
                "Please enter the email code",
                style: TextStyle(fontSize: 15, color: Colors.grey),
              ),

              SizedBox(height: height * 0.05),

              /// 🔥 OTP AUTO-FILL BOXES
              PinFieldAutoFill(
                codeLength: 6,
                currentCode: otpCode,
                onCodeChanged: (code) {
                      if (code != null) otpCode = code;
                    },
                decoration: BoxLooseDecoration(
                  bgColorBuilder: FixedColorBuilder(Colors.white),
                  strokeColorBuilder: FixedColorBuilder(Colors.grey.shade400),
                  radius: const Radius.circular(10),
                  gapSpace: 15,
                  textStyle: const TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),

              SizedBox(height: height * 0.035),


                /// DEV ONLY – remove in production
                Text(
                  "OTP: ${auth.forgotOtp.value}",
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const SizedBox(height: 20),


              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      const Text("Didn't receive OTP?", style: TextStyle(color: Colors.grey)),
                      
                      
                        /// ⏱ TIMER
                        auth.canResendOtp.value
                            ? const Text(
                                "OTP expired",
                                style: TextStyle(color: Colors.red),
                              )
                            : Text(
                                "Resend OTP in ${auth.otpSeconds.value}s",
                                style: const TextStyle(color: Colors.grey),
                              ),
                    ],
                  ),
                  
                    const SizedBox(height: 20),
                  
                    /// 🔁 RESEND BUTTON
                    TextButton(
                      onPressed: auth.canResendOtp.value
                          ? () {
                              auth.resendOtp();
                            }
                          : null,
                      child: const Text("Resend OTP"),
                    ),
                ],
              ),
             
              SizedBox(height: height * 0.045),

              SizedBox(
                width: double.infinity,
                height: 55,
                child: ElevatedButton(
                   onPressed: auth.isLoading.value
                          ? null
                          : () => verifyOtp(auth),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xff7ec4d4),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: const Text(
                    "Verify",
                    style: TextStyle(fontWeight: FontWeight.w600, fontSize: 18, color: Colors.white),
                  ),
                ),
              ),

              SizedBox(height: height * 0.04),

            ],
          ),
        ),
      ),
    );
  }

  Widget socialIcon(String path) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(shape: BoxShape.circle, color: Colors.grey.shade200),
      child: Image.asset(path, width: 24),
    );
  }
}