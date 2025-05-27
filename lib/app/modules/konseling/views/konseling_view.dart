import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:konselink/app/modules/artikel/views/artikel_view.dart';
import 'package:konselink/app/modules/kontak/views/kontak_view.dart';
import 'package:konselink/app/modules/home/views/home_view.dart';

class KonselingView extends StatefulWidget {
  const KonselingView({super.key});

  @override
  State<KonselingView> createState() => _KonselingViewState();
}

class _KonselingViewState extends State<KonselingView> {
void _onItemTapped(int index) {
  if (index == 0) {
    Get.toNamed('/profile');
  } else if (index == 1) {
    Get.toNamed('/home'); // Navigasi ke halaman Home
  } else if (index == 2) {
    Get.toNamed('/chat');
  }
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 16.0),
            child: Icon(Icons.notifications_none, color: Color(0xFF5D5555)),
          ),
        ],
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            RichText(
              text: const TextSpan(
                style: TextStyle(fontFamily: 'Poppins', fontSize: 22),
                children: [
                  TextSpan(
                    text: "Halo!, ",
                    style: TextStyle(
                      color: Color(0xFFB4D678),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  TextSpan(
                    text: "ada yang bisa dibantu?",
                    style: TextStyle(
                      color: Color(0xFF5D5555),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 5),
            const Text(
              "Layanan Konseling tersedia. Pilih menu sesuai kebutuhanmu.",
              style: TextStyle(
                fontFamily: 'Poppins',
                fontSize: 14,
                color: Color(0xFF5D5555),
              ),
            ),
            const SizedBox(height: 20),
            Container(
              height: 150,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                image: const DecorationImage(
                  image: AssetImage('assets/asse/card-bg2.png'),
                  fit: BoxFit.cover,
                ),
              ),
              child: Stack(
                children: [
                  const Positioned(
                    top: 16,
                    left: 20,
                    right: 100,
                    child: Text(
                      "Menjadi Versi Terbaik dari Diri Sendiri",
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 13,
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 16,
                    right: 20,
                    child: ElevatedButton.icon(
                      onPressed: () {},
                      icon: Image.asset(
                        'assets/button/book-icon.png',
                        height: 18,
                        width: 18,
                      ),
                      label: const Text("Baca"),
                      style: ElevatedButton.styleFrom(
                        foregroundColor: const Color(0xFF5D5555),
                        backgroundColor: Colors.white,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 16, vertical: 6),
                        textStyle: const TextStyle(
                          fontFamily: 'Poppins',
                          fontSize: 13,
                          fontWeight: FontWeight.w600,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 25),
            
            // Menu Buttons
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _MenuButton(
                  iconAsset: 'assets/button/beranda.png',
                  onTap: () => Get.to(() => const HomeView()),
                ),
                _MenuButton(
                  iconAsset: 'assets/button/konseling.png',
                  active: true,
                  onTap: () {},
                ),
                _MenuButton(
                  iconAsset: 'assets/button/artikel-tips.png',
                  onTap: () => Get.to(() => const ArtikelView()),
                ),
                _MenuButton(
                  iconAsset: 'assets/button/kirim-pesan.png',
                  onTap: () => Get.to(() => const KontakView()),
                ),
              ],
            ),

            const SizedBox(height: 25),

// Judul
const Text(
  "Jenis Konseling:",
  style: TextStyle(
    fontFamily: 'Poppins',
    fontSize: 16,
    fontWeight: FontWeight.w600,
    color: Color(0xFF5D5555),
  ),
),

const SizedBox(height: 12),

SizedBox(
  height: 130,
  child: SingleChildScrollView(
    scrollDirection: Axis.horizontal,
    padding: const EdgeInsets.symmetric(horizontal: 10),
    child: Row(
      children: [
        _JenisKonselingItem(
          title: "Konseling\nPribadi",
          color: Color(0xFFB4D678),
          iconAsset: 'assets/button/konseling_pribadi.png',
          description: "Membantu mengatasi masalah pribadi seperti kecemasan, kepercayaan diri, dan konflik batin.",
        ),
        const SizedBox(width: 12),
        _JenisKonselingItem(
          title: "Konseling\nAkademik",
          color: Color(0xFFFF9999),
          iconAsset: 'assets/button/konseling_akademik.png',
          description: "Mendukung proses belajar, mengelola waktu, dan menghadapi tekanan akademik.",
        ),
        const SizedBox(width: 12),
        _JenisKonselingItem(
          title: "Konseling\nKarir",
          color: Color(0xFFE6D4B7),
          iconAsset: 'assets/button/konseling_karir.png',
          description: "Membantu merencanakan tujuan karir, memahami minat dan potensi diri.",
        ),
        const SizedBox(width: 12),
        _JenisKonselingItem(
          title: "Konseling\nSosial",
          color: Color(0xFFB4D678),
          iconAsset: 'assets/button/konseling_sosial.png',
          description: "Menangani masalah hubungan pertemanan, adaptasi sosial, dan komunikasi.",
        ),
        const SizedBox(width: 12),
        _JenisKonselingItem(
          title: "Konseling\nKeluarga",
          color: Color(0xFFFF9999),
          iconAsset: 'assets/button/konseling_keluarga.png',
          description: "Membahas konflik keluarga, pola asuh, dan keharmonisan dalam rumah.",
        ),
        const SizedBox(width: 12),
        _JenisKonselingItem(
          title: "Konseling\nEmosional",
          color: Color(0xFFE6D4B7),
          iconAsset: 'assets/button/konseling_kelompok.png',
          description: "Membantu mengenali dan mengelola emosi yang mengganggu keseharian.",
        ),
        const SizedBox(width: 12),
        _JenisKonselingItem(
          title: "Konseling\nPsikologi",
          color: Color(0xFFB4D678),
          iconAsset: 'assets/button/konseling_spiritual.png',
          description: "Pendekatan profesional untuk memahami kondisi mental dan perilaku.",
        ),
        const SizedBox(width: 12),
        _JenisKonselingItem(
          title: "Konseling\nBimbingan",
          color: Color(0xFFFF9999),
          iconAsset: 'assets/button/konseling_mental.png',
          description: "Memberikan arahan dan dukungan dalam pengambilan keputusan penting.",
        ),
        const SizedBox(width: 12),
        _JenisKonselingItem(
          title: "Konseling\nKeagamaan",
          color: Color(0xFFE6D4B7),
          iconAsset: 'assets/button/konseling_kesehatan.png',
          description: "Membantu menemukan kedamaian melalui pendekatan spiritual dan nilai-nilai agama.",
        ),
      ],
    ),
  ),
),
      const SizedBox(height: 20),     

                  // Kategori Section
                  const Text(
                    "Kategori:",
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Color(0xFF5D5555),
                    ),
                  ),
                  const SizedBox(height: 12),
      Column(
        children: [
          GestureDetector(
            onTap: () {
              Get.toNamed('/jadwal');
            },
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image.asset(
                'assets/asse/card-kategori1.png',
                width: double.infinity,
                height: 100,
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(height: 12),

          GestureDetector(
            onTap: () {
              Get.toNamed('/status');
            },
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image.asset(
                'assets/asse/card-kategori3.png',
                width: double.infinity,
                height: 100,
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(height: 12),

          GestureDetector(
            onTap: () {
              Get.toNamed('/gurubk');
            },
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image.asset(
                'assets/asse/card-kategori2.png',
                width: double.infinity,
                height: 100,
                fit: BoxFit.cover,
              ),
            ),
          ),
        ],
      ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    
      bottomNavigationBar: ClipRRect(
        borderRadius: const BorderRadius.only(topLeft: Radius.circular(30), topRight: Radius.circular(30)),
        child: BottomAppBar(
          color: const Color(0xFFB4D678),
          elevation: 10,
          child: SizedBox(
            height: 60,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _NavBarItem(icon: Icons.person_outline, onTap: () => _onItemTapped(0)),
                _NavBarItem(icon: Icons.home, onTap: () => _onItemTapped(1)),
                _NavBarItem(icon: Icons.chat_bubble_outline, onTap: () => _onItemTapped(2)),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _JenisKonselingItem extends StatelessWidget {
  final String title;
  final Color color;
  final String iconAsset;
   final String description;

  const _JenisKonselingItem({
    required this.title,
    required this.color,
    required this.iconAsset,
    required this.description, 
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        showModalBottomSheet(
          context: context,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
          ),
          backgroundColor: Colors.white,
          builder: (context) {
            return Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Container(
                      width: 50,
                      height: 5,
                      decoration: BoxDecoration(
                        color: Colors.grey[300],
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  Row(
                    children: [
                      Container(
                        width: 50,
                        height: 50,
                        decoration: BoxDecoration(
                          color: color,
                          shape: BoxShape.circle,
                        ),
                        child: Center(
                          child: Image.asset(iconAsset, width: 30, height: 30),
                        ),
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: Text(
                          title.replaceAll('\n', ' '),
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                            fontFamily: 'Poppins',
                            color: Color(0xFF5D5555),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  Text(
                    description,
                    style: const TextStyle(
                      fontSize: 14,
                      fontFamily: 'Poppins',
                      color: Color(0xFF5D5555),
                    ),
                  ),
                  const SizedBox(height: 20),
                  Center(
                    child: ElevatedButton(
                      onPressed: () {
                        // Navigasi ke halaman detail jika ada
                        Navigator.pop(context);
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: color,
                        foregroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                        padding: const EdgeInsets.symmetric(
                          horizontal: 32,
                          vertical: 12,
                        ),
                      ),
                      child: const Text(
                        "Kembali",
                        style: TextStyle(fontFamily: 'Poppins'),
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        );
      },
      child: Column(
        children: [
          Container(
            width: 80,
            height: 80,
            decoration: BoxDecoration(
              color: color,
              shape: BoxShape.circle,
            ),
            child: Center(
              child: Image.asset(
                iconAsset,
                width: 50,
                height: 50,
                errorBuilder: (context, error, stackTrace) {
                  return const Icon(Icons.person, size: 50, color: Colors.white);
                },
              ),
            ),
          ),
          const SizedBox(height: 8),
          Text(
            title,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontFamily: 'Poppins',
              fontSize: 12,
              fontWeight: FontWeight.w500,
              color: color,
            ),
          ),
        ],
      ),
    );
  }
}


class _MenuButton extends StatelessWidget {
  final String iconAsset;
  final bool active;
  final VoidCallback? onTap;

  const _MenuButton({
    required this.iconAsset,
    this.active = false,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        height: 80,
        width: 80,
        decoration: BoxDecoration(
          color: active ? const Color(0xFFB4D678) : const Color(0xFF5D5555),
          borderRadius: BorderRadius.circular(24),
          border: Border.all(
            color: active ? const Color(0xFF9BC55F) : Colors.grey.withOpacity(0.2),
            width: 2,
          ),
          boxShadow: active
              ? [BoxShadow(color: Colors.black.withOpacity(0.1), blurRadius: 12, offset: const Offset(0, 4), spreadRadius: 2)]
              : [],
        ),
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: AnimatedScale(
            scale: active ? 1.1 : 1.0,
            duration: const Duration(milliseconds: 300),
            child: Image.asset(
              iconAsset,
              fit: BoxFit.contain,
              color: active ? Colors.white : Colors.white,
              colorBlendMode: BlendMode.modulate,
            ),
          ),
        ),
      ),
    );
  }
}

class _NavBarItem extends StatelessWidget {
  final IconData icon;
  final VoidCallback onTap;

  const _NavBarItem({required this.icon, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 50,
        height: 50,
        decoration: const BoxDecoration(
          color: Color(0xFF8EA76C), // Warna latar untuk inactive
          shape: BoxShape.circle,
        ),
        child: Icon(
          icon,
          color: Colors.white, // Warna ikon untuk inactive
          size: 26,
        ),
      ),
    );
  }
}