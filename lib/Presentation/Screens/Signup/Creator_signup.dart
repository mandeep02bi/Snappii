import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:snappis/Domains/controllers/authcontroller.dart';
import 'package:snappis/Presentation/Widgets/Onboarding_header.dart';
import 'package:snappis/Presentation/Widgets/Auth_widgets.dart';

class CreatorSignup extends StatefulWidget {
  const CreatorSignup({super.key});

  @override
  State<CreatorSignup> createState() => _CreatorSignupState();
}

class _CreatorSignupState extends State<CreatorSignup> {
  bool _obscurePassword = true;
  bool _agreedToTerms = false;
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
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(height: 10),

                  const Text(
                    'Create Account',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF1A1A2E),
                    ),
                  ),
                  const SizedBox(height: 24),

                  const AuthLabel(text: 'Name'),
                  AuthInputField(
                    hint: 'John Doe',
                    onChanged: (v) => auth.nameCtrl.value = v,
                  ),
                  const SizedBox(height: 16),

                  const AuthLabel(text: 'Phone Number'),
                  AuthPhoneInput(onChanged: (v) => auth.phoneCtrl.value = v),
                  const SizedBox(height: 16),

                  const AuthLabel(text: 'Email'),
                  AuthInputField(
                    hint: 'Doe12@gmail.com',
                    onChanged: (v) => auth.emailCtrl.value = v,
                  ),
                  const SizedBox(height: 16),

                  const AuthLabel(text: 'Password'),
                  AuthInputField(
                    hint: '••••••••',
                    isPassword: true,
                    obscure: _obscurePassword,
                    toggle: () =>
                        setState(() => _obscurePassword = !_obscurePassword),
                    onChanged: (v) => auth.passwordCtrl.value = v,
                  ),
                  const SizedBox(height: 12),

                  Row(
                    children: [
                      Checkbox(
                        value: _agreedToTerms,
                        activeColor: const Color(0xFF8B5CF6),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(4),
                        ),
                        onChanged: (v) =>
                            setState(() => _agreedToTerms = v ?? false),
                      ),
                      const Text('Agree with '),
                      GestureDetector(
                        onTap: () {},
                        child: const Text(
                          'Term & Condition',
                          style: TextStyle(
                            color: Color(0xFF8B5CF6),
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: height * 0.03),

                  Obx(
                    () => AuthGradientButton(
                      label: 'Sign Up',
                      isLoading: auth.isLoading.value,
                      onPressed: () => auth.Csignup(),
                    ),
                  ),
                  SizedBox(height: height * 0.025),

                  GestureDetector(
                    onTap: () => Get.toNamed('/Creator-Login'),
                    child: RichText(
                      text: const TextSpan(
                        text: 'Already have an account? ',
                        style: TextStyle(
                          color: Color(0xFF888888),
                          fontSize: 14,
                        ),
                        children: [
                          TextSpan(
                            text: 'Login',
                            style: TextStyle(
                              color: Color(0xFF8B5CF6),
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: height * 0.03),

                  const AuthSocialCircle(asset: 'assets/icons/social.png'),
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
