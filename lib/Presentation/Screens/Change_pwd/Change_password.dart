import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:snappis/Domains/controllers/authcontroller.dart';

class ChangePassword extends StatefulWidget {
  const ChangePassword({super.key});

  @override
  State<ChangePassword> createState() => _ChangePasswordState();
}

class _ChangePasswordState extends State<ChangePassword> {
  final AuthController auth = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width  = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: width * 0.07),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: height * 0.03),

              /// Title
              Text(
                "Change Password",
                style: TextStyle(
                  fontSize: height * 0.034,
                  fontWeight: FontWeight.bold,
                ),
              ),

              SizedBox(height: 6),

               /// Subtitle
              Text(
                "Fill your information bellow \nwith your New Password",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: height * 0.018,
                  color: Colors.grey.shade600,
                ),
              ),

              SizedBox(height: height * 0.04),

              /// Name
              _label("New Password"),
              _inputField(
                hint: "Add a 8 digit password use [A-Z,a-z,0-9,!,@] in your password",
                onChanged: (v) => auth.newPassword.value = v,

              ),
              SizedBox(height: height * 0.04),
              _label("Confirm New Password"),
              _inputField(
                hint: "Add a 8 digit password use [A-Z,a-z,0-9,!,@] in your same password",
                onChanged: (v) => auth.confirmPassword.value = v,

              ),
              SizedBox(height: height * 0.04),


              /// Sign Up Button
              /// 
              Obx(() => SizedBox(
                  width: double.infinity,
                  height: height * 0.065,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xff8cc7d5),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),

                    onPressed: auth.isLoading.value
                        ? null
                        : () {
                          auth.changePassword();
                            // auth.signup();
                          },

                    child: auth.isLoading.value
                        ? const CircularProgressIndicator(
                            color: Colors.white,
                            strokeWidth: 2,
                          )
                        : Text(
                            "Change Password",
                            style: TextStyle(
                              fontSize: height * 0.022,
                              color: Colors.white,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                  ),
                )),
            ]
          ),
        ),
      ),
    );
  }
   Widget _label(String text) => Align(
        alignment: Alignment.centerLeft,
        child: Padding(
          padding: const EdgeInsets.only(bottom: 8),
          child: Text(
            text,
            style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
          ),
        ),
      );

  Widget _inputField({
    required String hint,
    bool isPassword = false,
    bool obscure = false,
    VoidCallback? toggle,
    Function(String)? onChanged,

    
  }) {
    return TextField(
      onChanged: onChanged,
      obscureText: isPassword ? obscure : false,
      decoration: InputDecoration(
        hintText: hint,
        filled: true,
        fillColor: Colors.grey.shade100,
        suffixIcon: isPassword
            ? IconButton(
                icon: Icon(
                  obscure ? Icons.visibility_off : Icons.visibility,
                  color: Colors.grey.shade600,
                ),
                onPressed: toggle,
              )
            : null,
        hintStyle: const TextStyle(color: Colors.grey),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }
}