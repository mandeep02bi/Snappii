import 'package:flutter/material.dart';
import 'package:get/get.dart';
class BusinessMainPage extends StatefulWidget {
  const BusinessMainPage({super.key});

  @override
  State<BusinessMainPage> createState() => _BusinessMainPageState();
}

class _BusinessMainPageState extends State<BusinessMainPage> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      body: Container(
        width: size.width,
        height: size.height,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color.fromARGB(233, 245, 56, 213), 
              Color.fromARGB(255, 145, 54, 243),
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),

        child: Stack(
          children: [
            // Floating transparent circles
            Positioned(
              top: 80,
              left: 30,
              child: _buildCircle(60),
            ),
            Positioned(
              top: 150,
              right: 40,
              child: _buildCircle(40),
            ),
            Positioned(
              bottom: 220,
              left: 60,
              child: _buildCircle(35),
            ),

            // MAIN CONTENT
            SafeArea(
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // App Logo icon
                    // const Icon(Icons.headphones, color: Colors.white, size: 80),

                    // const SizedBox(height: 10),

                    const Text(
                      "Snappi",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 22,
                        fontWeight: FontWeight.w500,
                        letterSpacing: 1.2,
                      ),
                    ),

                    const SizedBox(height: 40),

                    const Text(
                      "Welcome Back",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 26,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    const SizedBox(height: 50),

                    // SIGN IN BUTTON
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 40),
                      child: OutlinedButton(
                        onPressed: () {
                          // Navigator.of(context).push(
                          //   MaterialPageRoute(
                          //     builder: (_) => const BusinessLogin(),
                          //   ),
                          // );       
                            Get.toNamed("/Brand-Login");
                   
                        },
                        style: OutlinedButton.styleFrom(
                          side: const BorderSide(color: Colors.white, width: 1.8),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(40),
                          ),
                          padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 30),
                        ),
                        child: const Text(
                          "SIGN IN as Brand",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ),

                    const SizedBox(height: 18),

                    // SIGN UP BUTTON
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 40),
                      child: ElevatedButton(
                        onPressed: () {
                          // Navigator.of(context).push(
                          //   MaterialPageRoute(
                          //     builder: (_) => const BusinessSignup(),
                          //   ),
                          // );
                            Get.toNamed("/Brand-Signup");

                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white,
                          foregroundColor: Colors.black,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(40),
                          ),
                          padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 25),
                        ),
                        child: const Text(
                          "SIGN UP as a Brand",
                          style: TextStyle(fontSize: 16),
                        ),
                      ),
                    ),

                    const SizedBox(height: 50),

                   

                   
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Floating circle widget
  Widget _buildCircle(double size) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.white.withOpacity(0.09),
      ),
    );
  }

  // Social media icon widget

}