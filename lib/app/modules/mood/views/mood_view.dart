import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MoodView extends StatelessWidget {
  const MoodView({Key? key}) : super(key: key);

  Widget buildMoodImage(String imagePath, VoidCallback onTap, double imageHeight) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: GestureDetector(
        onTap: onTap,
        child: Center(
          child: Image.asset(
            imagePath,
            height: imageHeight,
            fit: BoxFit.contain,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    final horizontalPadding = width * 0.06; // 6% padding horizontally
    final moodImageHeight = height * 0.15;  // 15% dari tinggi layar

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: horizontalPadding, vertical: 16),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 10),

                // Logo + KonseLink
                Row(
                  children: [
                    Image.asset(
                      'assets/logo/logo-splash.png',
                      width: 40,
                      height: 40,
                    ),
                    const SizedBox(width: 15),
                    const Text(
                      'KonseLink',
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        color: Color(0xFF84B547),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),

                // Pertanyaan
                const Text(
                  'Bagaimana mood Anda hari ini?',
                  style: TextStyle(
                    color: Color(0xFF5D5555),
                    fontFamily: 'Poppins',
                    fontSize: 18,
                  ),
                ),
                const SizedBox(height: 24),

                // Gambar mood dengan ukuran responsif
                buildMoodImage('assets/asse/bahagia.png', () {
                  Get.toNamed('/home');
                }, moodImageHeight),
                buildMoodImage('assets/asse/sedih.png', () {
                  Get.toNamed('/home');
                }, moodImageHeight),
                buildMoodImage('assets/asse/marah.png', () {
                  Get.toNamed('/home');
                }, moodImageHeight),
                buildMoodImage('assets/asse/santai.png', () {
                  Get.toNamed('/home');
                }, moodImageHeight),

                const SizedBox(height: 24),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
