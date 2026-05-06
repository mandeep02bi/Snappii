import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:snappis/Domains/controllers/authcontroller.dart';
import 'package:snappis/Presentation/Widgets/Onboarding_header.dart';
import 'package:snappis/Presentation/Widgets/Auth_widgets.dart';

class BusinessLogin extends StatefulWidget {
  const BusinessLogin({super.key});

  @override
  State<BusinessLogin> createState() => _BusinessLoginState();
}

class _BusinessLoginState extends State<BusinessLogin> {
  bool _obscure = true;
  final AuthController auth = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.white,
      extendBodyBehindAppBar: true,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const OnboardingHeader(heightFactor: 0.22),

            Padding(
              padding: EdgeInsets.symmetric(horizontal: width * 0.07),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 10),

                  const Center(
                    child: Text(
                      'Login',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF1A1A2E),
                      ),
                    ),
                  ),
                  SizedBox(height: height * 0.035),

                  const AuthLabel(text: 'Email:'),
                  AuthInputField(
                    hint: 'John Doe',
                    onChanged: (v) => auth.emailCtrl.value = v,
                  ),
                  SizedBox(height: height * 0.022),

                  const AuthLabel(text: 'Password'),
                  AuthInputField(
                    hint: '••••••••',
                    isPassword: true,
                    obscure: _obscure,
                    toggle: () => setState(() => _obscure = !_obscure),
                    onChanged: (v) => auth.passwordCtrl.value = v,
                  ),
                  const SizedBox(height: 8),

                  Align(
                    alignment: Alignment.centerRight,
                    child: GestureDetector(
                      onTap: () => Get.toNamed('/fpass'),
                      child: const Text(
                        'Forgot Password',
                        style: TextStyle(
                          color: Color(0xFF888888),
                          fontSize: 13,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: height * 0.04),

                  Obx(
                    () => AuthGradientButton(
                      label: 'Login',
                      isLoading: auth.isLoading.value,
                      onPressed: () => auth.login(),
                    ),
                  ),
                  SizedBox(height: height * 0.03),

                  Center(
                    child: GestureDetector(
                      onTap: () => Get.toNamed('/Brand-Signup'),
                      child: RichText(
                        text: const TextSpan(
                          text: "Don't have an account? ",
                          style: TextStyle(
                            color: Color(0xFF888888),
                            fontSize: 14,
                          ),
                          children: [
                            TextSpan(
                              text: 'Sign Up',
                              style: TextStyle(
                                color: Color(0xFF8B5CF6),
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: height * 0.03),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
