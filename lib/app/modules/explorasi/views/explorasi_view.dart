import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ExplorasiView extends StatefulWidget {
  const ExplorasiView({super.key});

  @override
  State<ExplorasiView> createState() => _ExplorasiViewState();
}

class _ExplorasiViewState extends State<ExplorasiView> {
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
      backgroundColor: const Color(0xFFF8FAFB),
      body: SafeArea(
        child: Column(
          children: [
            // Header
            Container(
              color: Colors.white,
              padding: const EdgeInsets.fromLTRB(20, 16, 20, 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  GestureDetector(
                    onTap: () => Get.back(),
                    child: const Icon(
                      Icons.arrow_back_ios_rounded,
                      size: 20,
                      color: Color(0xFF3E3E3E),
                    ),
                  ),
                  const SizedBox(height: 24),
                  RichText(
                    text: const TextSpan(
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 24,
                        fontWeight: FontWeight.w700,
                        height: 1.3,
                      ),
                      children: [
                        TextSpan(
                          text: "Eksplorasi ",
                          style: TextStyle(color: Color(0xFFB4D678)),
                        ),
                        TextSpan(
                          text: "Pengetahuan\nTentang Dirimu",
                          style: TextStyle(color: Color(0xFF3E3E3E)),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 12),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
                    decoration: BoxDecoration(
                      color: const Color(0xFFB4D678).withOpacity(0.1),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: const Text(
                      "✨ Temukan wawasan baru untuk pengembangan diri",
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 13,
                        fontWeight: FontWeight.w500,
                        color: Color(0xFF3E3E3E),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            // Konten eksplorasi
            Expanded(
              child: ListView(
                padding: const EdgeInsets.all(20),
                children: const [
                  _ExplorasiItem(
                    imagePath: 'assets/asse/explorasi-kelas.png',
                    title: 'Gugup Berbicara di Depan Kelas Itu Wajar',
                    category: '💪 Kepercayaan Diri',
                    content: 'Merasa gugup saat harus berbicara di depan kelas itu sangat normal. Bahkan, banyak orang dewasa pun masih merasakan hal yang sama. Yang penting bukan menghilangkan rasa gugup, tapi belajar mengelolanya dengan tenang.Tarik napas dalam, persiapkan materi dengan baik, dan ingat: semua orang pernah merasa gugup. Keberanian bukan berarti tidak takut, tapi tetap maju meskipun takut.',
                    accentColor: Color(0xFFB4D678),
                  ),
                  _ExplorasiItem(
                    imagePath: 'assets/asse/explorasi-malas.png',
                    title: 'Istirahat Bukan Berarti Malas',
                    category: '🌱 Self Care',
                    content: 'Saat kamu merasa lelah, itu tanda tubuh dan pikiranmu butuh waktu untuk pulih. Banyak orang menganggap bahwa terus bekerja tanpa henti adalah kunci produktivitas, padahal istirahat yang cukup justru membantu meningkatkan fokus dan semangat. Meluangkan waktu untuk diri sendiri, tidur yang cukup, atau sekadar bernafas sejenak bukanlah bentuk kemalasan, melainkan bentuk self care yang penting. Ingat, kamu bukan robot. Kamu berhak merasa lelah dan berhak untuk memulihkan energi. Dengan istirahat yang sehat, kamu akan kembali dengan tenaga dan pikiran yang lebih jernih.',
                    accentColor: Color(0xFFB4D678),
                  ),
                  _ExplorasiItem(
                    imagePath: 'assets/asse/explorasi-hebat.png',
                    title: 'Gagal Sekali Bukan Akhir Segalanya',
                    category: '🚀 Motivasi',
                    content: 'Setiap orang pernah mengalami kegagalan, dan itu adalah bagian wajar dari proses tumbuh dan belajar. Kegagalan bukanlah akhir dari perjalanan, tapi batu loncatan untuk menjadi pribadi yang lebih kuat. Sering kali, dari kegagalan kita justru menemukan pelajaran yang paling berharga. Kamu tidak sendiri dalam perjuangan ini, dan kamu tidak harus sempurna. Yang terpenting adalah bagaimana kamu bangkit, belajar dari kesalahan, dan terus mencoba. Kesuksesan bukan tentang tidak pernah jatuh, tetapi tentang selalu bangkit setiap kali terjatuh.',
                    accentColor: Color(0xFFB4D678),
                  ),
                  _ExplorasiItem(
                    imagePath: 'assets/asse/explorasi-sendiri.png',
                    title: 'Kamu Tidak Sendirian',
                    category: '💝 Kesehatan Mental',
                    content: 'Perasaan sendiri bisa muncul kapan saja, tanpa kita duga. Kadang datang seperti gelombang yang tiba-tiba menghantam, membuat hati terasa berat dan pikiran seolah terkunci dalam ruang sepi. Tapi ingatlah, meski saat itu terasa sangat sunyi, kamu tidak pernah benar-benar sendiri. Ada banyak orang yang peduli, yang siap mendengarkan dan menemanimu dalam setiap langkah. Mengakui dan merasakannya adalah langkah awal untuk menemukan kekuatan baru dalam dirimu. Saat kamu berbagi, kamu membuka pintu bagi harapan dan kehangatan yang bisa mengubah hari-harimu.',
                    accentColor: Color(0xFFB4D678),
                  ),
                  SizedBox(height: 20),
                ],
              ),
            ),
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


class _ExplorasiItem extends StatelessWidget {
  final String imagePath;
  final String title;
  final String category;
  final String content;
  final Color accentColor;

  const _ExplorasiItem({
    required this.imagePath,
    required this.title,
    required this.category,
    required this.content,
    required this.accentColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 12,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.vertical(top: Radius.circular(16)),
            child: Image.asset(
              imagePath,
              height: 160,
              width: double.infinity,
              fit: BoxFit.cover,
              errorBuilder: (_, __, ___) => Container(
                height: 160,
                color: Colors.grey.shade300,
                child: const Icon(Icons.image, size: 48),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  decoration: BoxDecoration(
                    color: accentColor.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Text(
                    category,
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                      color: accentColor,
                      fontFamily: 'Poppins',
                    ),
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                    fontFamily: 'Poppins',
                    color: Color(0xFF3E3E3E),
                  ),
                ),
                const SizedBox(height: 12),
                ElevatedButton(
                  onPressed: () => _showDetailDialog(context),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: accentColor,
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                  ),
                  child: const Text('Lihat'),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  void _showDetailDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (_) => Dialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
                child: Image.asset(
                  imagePath,
                  height: 180,
                  width: double.infinity,
                  fit: BoxFit.cover,
                  errorBuilder: (_, __, ___) => Container(
                    height: 180,
                    color: Colors.grey.shade300,
                    child: const Center(child: Icon(Icons.image, size: 48)),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      category,
                      style: TextStyle(
                        color: accentColor,
                        fontSize: 13,
                        fontWeight: FontWeight.w600,
                        fontFamily: 'Poppins',
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      title,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                        fontFamily: 'Poppins',
                      ),
                    ),
                    const SizedBox(height: 12),
                    Text(
                      content,
                      style: const TextStyle(
                        fontSize: 14,
                        height: 1.6,
                        fontFamily: 'Poppins',
                        color: Color(0xFF5E5E5E),
                      ),
                      textAlign: TextAlign.justify,
                    ),
                    const SizedBox(height: 20),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () => Navigator.pop(context),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: accentColor,
                          padding: const EdgeInsets.symmetric(vertical: 14),
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
                        ),
                        child: const Text(
                          'Kembali',
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 16,
                            fontFamily: 'Poppins',
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
