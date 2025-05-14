import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/welcome_controller.dart';

class WelcomeView extends GetView<WelcomeController> {
  const WelcomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text.rich(
                TextSpan(
                  children: [
                    TextSpan(
                      text: "Selamat Datang di\n",
                      style: TextStyle(
                        fontFamily: 'Poppins-Medium',
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.black87,
                      ),
                    ),
                    TextSpan(
                      text: "KonseLink.",
                      style: TextStyle(
                        fontFamily: 'Poppins-Medium',
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF7BA93D),
                      ),
                    ),
                  ],
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 30),
              Image.asset(
                'assets/logo/logo-splash.png', 
                height: 200,
              ),
              const SizedBox(height: 30),
              const Text(
                "Ruang nyaman untuk temukan\ndukungan, mendapatkan bimbingan,\ndan menemukan solusi bersama.\nKami siap mendengar Anda!",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 14, color: Colors.black87),
              ),
              const SizedBox(height: 20),
              const Text(
                "Made by SPARSYA",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF7BA93D),
                ),
              ),
              const SizedBox(height: 30),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.brown[800],
                  padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 14),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(24),
                  ),
                ),
                onPressed: () {
                  // Navigasi ke halaman berikutnya jika perlu
                },
                child: const Text(
                  "Get Started",
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
