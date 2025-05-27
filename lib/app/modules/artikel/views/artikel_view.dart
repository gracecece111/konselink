import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:konselink/app/modules/kontak/views/kontak_view.dart';
import 'package:konselink/app/modules/home/views/home_view.dart';
import 'package:konselink/app/modules/konseling/views/konseling_view.dart';

class ArtikelView extends StatefulWidget {
  const ArtikelView({super.key});

  @override
  State<ArtikelView> createState() => _ArtikelViewState();
}

class _ArtikelViewState extends State<ArtikelView> {
  void _onItemTapped(int index) {
    if (index == 0) {
      Get.toNamed('/profile');
    } else if (index == 1) {
      Get.toNamed('/home');
    } else if (index == 2) {
      Get.toNamed('/chat');
    }
  }

void _showArtikelModal(String title) {
  showDialog(
    context: context,
    builder: (context) => AlertDialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      title: Text(title, style: const TextStyle(fontFamily: 'Poppins', fontWeight: FontWeight.bold)),
      content: SingleChildScrollView(
        child: const Text(
'''Kita semua diciptakan dengan keunikan masing-masing. Tidak perlu membandingkan diri dengan orang lain, karena perjalanan hidup setiap orang berbeda. Menjadi versi terbaik dari diri sendiri bukan berarti harus sempurna, tapi berarti terus belajar, bertumbuh, dan mencintai diri apa adanya.

Berikut adalah beberapa langkah kecil yang bisa kamu lakukan untuk menjadi versi terbaik dari dirimu:

1. Kenali Diri Sendiri
Apa yang kamu sukai? Apa yang membuatmu semangat? Mengenali minat, nilai, dan kekuatanmu akan membantumu menentukan arah hidup dengan lebih yakin.

2. Berani Keluar dari Zona Nyaman
Tantangan adalah bagian dari pertumbuhan. Jangan takut gagal. Setiap kegagalan membawa pelajaran berharga.

3. Rawat Kesehatan Mental dan Fisikmu
Tidur cukup, makan sehat, olahraga, dan beri waktu untuk dirimu beristirahat. Pikiran dan tubuh yang sehat akan membantumu menjalani hari dengan lebih baik.

4. Kurangi Membandingkan Diri dengan Orang Lain
Fokuslah pada perkembangan diri sendiri. Setiap langkah kecil yang kamu ambil sudah merupakan kemajuan besar.

5. Jangan Lupa Bersyukur dan Berdoa
Luangkan waktu untuk merenung dan bersyukur. Doa akan menenangkan hati dan menguatkanmu untuk terus melangkah.

“You are enough, just as you are — and you are capable of becoming even more.” 🌱
''',
          style: TextStyle(fontFamily: 'Poppins'),
        ),
      ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text("Tutup", style: TextStyle(color: Color(0xFF5D5555))),
          ),
        ],
      ),
    );
  }

  Widget _buildArtikelCard(String imagePath, String title) {
    return Container(
      height: 150,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        image: DecorationImage(
          image: AssetImage(imagePath),
          fit: BoxFit.cover,
        ),
      ),
      child: Stack(
        children: [
          Positioned(
            top: 16,
            left: 20,
            right: 100,
            child: Text(
              title,
              style: const TextStyle(
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
              onPressed: () => _showArtikelModal(title),
              icon: Image.asset('assets/button/book-icon.png', height: 18, width: 18),
              label: const Text("Baca"),
              style: ElevatedButton.styleFrom(
                foregroundColor: const Color(0xFF5D5555),
                backgroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
                textStyle: const TextStyle(
                  fontFamily: 'Poppins',
                  fontSize: 13,
                  fontWeight: FontWeight.w600,
                ),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
              ),
            ),
          ),
        ],
      ),
    );
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
                    text: "Hai, ",
                    style: TextStyle(color: Color(0xFFB4D678), fontWeight: FontWeight.bold),
                  ),
                  TextSpan(
                    text: "mau baca artikel apa hari ini?",
                    style: TextStyle(color: Color(0xFF5D5555), fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 25),

            // Menu
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _MenuButton(iconAsset: 'assets/button/beranda.png', onTap: () => Get.to(() => const HomeView())),
                _MenuButton(iconAsset: 'assets/button/konseling.png', onTap: () => Get.to(() => const KonselingView())),
                _MenuButton(iconAsset: 'assets/button/artikel-tips.png', active: true, onTap: () {}),
                _MenuButton(iconAsset: 'assets/button/kirim-pesan.png', onTap: () => Get.to(() => const KontakView())),
              ],
            ),
            const SizedBox(height: 25),

            // Artikel Cards
            _buildArtikelCard('assets/asse/card-bg3.png', 'Menjadi Versi Terbaik dari Diri Sendiri'),
            const SizedBox(height: 20),
            _buildArtikelCard('assets/asse/card-bg4.png', 'Cara Menentukan Jurusan yang Tepat untuk Masa Depan'),
            const SizedBox(height: 20),
            _buildArtikelCard('assets/asse/card-bg5.png', '5 Tips Memilih Jurusan SMK/SMA yang Sesuai Passion'),
            const SizedBox(height: 20),
            _buildArtikelCard('assets/asse/card-bg6.png', 'Belajar Mengenali Diri Sendiri: Siapa Aku, Apa Mimpiku?'),
            const SizedBox(height: 20),
            _buildArtikelCard('assets/asse/card-bg7.png', 'Self-Love: Mencintai Diri Sendiri Tanpa Rasa Bersalah'),
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
              children: <Widget>[
                _NavBarItem(icon: Icons.person_outline, isActive: false, onTap: () => _onItemTapped(0)),
                _NavBarItem(icon: Icons.home, isActive: false, onTap: () => _onItemTapped(1)),
                _NavBarItem(icon: Icons.chat_bubble_outline, isActive: false, onTap: () => _onItemTapped(2)),
              ],
            ),
          ),
        ),
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
              color: Colors.white,
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
  final bool isActive;
  final VoidCallback onTap;

  const _NavBarItem({
    required this.icon,
    required this.isActive,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final Color inactiveBgColor = const Color(0xFF8EA76C);
    final Color inactiveIconColor = Colors.white;

    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 50,
        height: 50,
        decoration: BoxDecoration(
          color: inactiveBgColor,
          shape: BoxShape.circle,
        ),
        child: Icon(
          icon,
          color: inactiveIconColor,
          size: 26,
        ),
      ),
    );
  }
}
