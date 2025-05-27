import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PilihanView extends StatelessWidget {
  const PilihanView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF3F3F3),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            children: [
              const SizedBox(height: 50),

              // Judul atas
              const Text.rich(
                TextSpan(
                  text: 'Temukan ',
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: 25,
                    color: Color(0xFF5D5555),
                    fontWeight: FontWeight.w700,
                  ),
                  children: [
                    TextSpan(
                      text: 'dukungan',
                      style: TextStyle(
                        color: Color(0xFFA3C94A),
                      ),
                    ),
                    TextSpan(
                      text: '\n yang Anda butuhkan.',
                    ),
                  ],
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 5),

              const Text(
                'Masuk untuk melanjutkan.',
                style: TextStyle(
                  fontFamily: 'Poppins',
                  fontSize: 16,
                  color: Color(0xFF5D5555),
                ),
              ),

              const SizedBox(height: 30),

              // Konten Tengah
              Expanded(
                child: Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Image.asset(
                        'assets/logo/maskot-hi.png',
                        height: 270,
                      ),
                      const SizedBox(height: 30),

                      const Text(
                        'Pilih opsi dibawah ini\nuntuk melanjutkan :',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontFamily: 'Poppins',
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                          color: Color(0xFF5D5555),
                        ),
                      ),
                      const SizedBox(height: 25),

                      // Tombol Login
                      GestureDetector(
                        onTap: () => Get.toNamed('/login'),
                        child: Image.asset(
                          'assets/button/login.png',
                          height: 50,
                        ),
                      ),
                      const SizedBox(height: 16),

                      // Tombol Sign Up
                      GestureDetector(
                        onTap: () => Get.toNamed('/signup'),
                        child: Image.asset(
                          'assets/button/sign-up.png',
                          height: 50,
                        ),
                      ),
                      const SizedBox(height: 25),

                      // Teks Anonim
                      GestureDetector(
                        onTap: () => Get.toNamed('/mood'),
                        child: RichText(
                          textAlign: TextAlign.center,
                          text: const TextSpan(
                            style: TextStyle(
                              fontFamily: 'Poppins',
                              fontSize: 14,
                              color: Colors.black,
                            ),
                            children: [
                              TextSpan(
                                text:
                                    'Bebas cerita, identitas terjaga.\nLanjutkan dengan ',
                              ),
                              TextSpan(
                                text: 'Anonim',
                                style: TextStyle(
                                  color: Color(0xFFA3C94A),
                                  fontWeight: FontWeight.bold,
                                  decoration: TextDecoration.underline,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
