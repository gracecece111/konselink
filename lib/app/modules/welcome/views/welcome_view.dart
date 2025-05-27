// welcome_view.dart
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/welcome_controller.dart';

class WelcomeView extends GetView<WelcomeController> {
  const WelcomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            children: [
              const SizedBox(height: 50),

              // Judul atas
              RichText(
                textAlign: TextAlign.start,
                text: const TextSpan(
                  children: [
                    TextSpan(
                      text: 'Selamat Datang di\n',
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 25,
                        color: Color(0xFF5D5555),
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    TextSpan(
                      text: 'KonseLink.',
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 25,
                        color: Color(0xFFA3C94A),
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 20),

              // Bagian tengah: logo + deskripsi + Made by
              Expanded(
                child: Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Image.asset(
                        'assets/logo/logo-splash.png',
                        height: 260,
                      ),
                      const SizedBox(height: 20),
                      const Text(
                        'Ruang nyaman untuk temukan\ndukungan, mendapatkan bimbingan,\ndan menemukan solusi bersama.\nKami siap mendengar Anda!',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontFamily: 'Poppins',
                          fontSize: 13,
                          color: Color(0xFF666666),
                          height: 1.5,
                        ),
                      ),
                      const SizedBox(height: 16),
                      const Text(
                        'Made by SPARSYA',
                        style: TextStyle(
                          fontFamily: 'Poppins',
                          fontSize: 13,
                          color: Color(0xFFA3C94A),
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              // Tombol Get Started
              GestureDetector(
                onTap: () {
                  Get.toNamed('/pilihan');
                },
                child: Center(
                  child: Image.asset(
                    'assets/button/get-started.png',
                    height: 50,
                  ),
                ),
              ),

              const SizedBox(height: 40),
            ],
          ),
        ),
      ),
    );
  }
}
