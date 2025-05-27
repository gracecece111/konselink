import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:konselink/app/modules/artikel/views/artikel_view.dart';
import 'package:konselink/app/modules/konseling/views/konseling_view.dart';
import 'package:konselink/app/modules/kontak/views/kontak_view.dart';
import 'package:konselink/app/modules/gurubk/views/gurubk_view.dart';
import 'package:konselink/app/modules/explorasi/views/explorasi_view.dart';
import 'package:konselink/app/modules/profile/views/profile_view.dart';
import 'package:konselink/app/modules/chat/views/chat_view.dart';
import 'package:konselink/app/modules/notifikasi/views/notifikasi_view.dart';

class NotifikasiPage extends StatelessWidget {
  const NotifikasiPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Notif'),
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications_none, color: Color(0xFF5D5555)),
            onPressed: () {
              Get.to(() => const NotifikasiView());
            },
          ),
        ],
      ),
    );
  }
}

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  int _selectedIndex = 1;

  void _onItemTapped(int index) {
    if (index == 0) {
      Get.to(() => const ProfileView());
    } else if (index == 2) {
      Get.to(() => const ChatView());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications_none, color: Color(0xFF5D5555)),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const NotifikasiView()),
              );
            },
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
                    text: "Hello, ",
                    style: TextStyle(color: Color(0xFFB4D678), fontWeight: FontWeight.bold),
                  ),
                  TextSpan(
                    text: "Teman KonseLink 👋!",
                    style: TextStyle(color: Color(0xFF5D5555), fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 5),
            const Text(
              "Butuh bantuan? Mulai menjelajahi menu di bawah ini.",
              style: TextStyle(fontFamily: 'Poppins', fontSize: 14, color: Color(0xFF5D5555)),
            ),
            const SizedBox(height: 20),
            Container(
              height: 150,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                image: const DecorationImage(
                  image: AssetImage('assets/asse/card-bg.png'),
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
                      "Cara Berkomunikasi\ndengan Teman agar\nLebih Saling Memahami",
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
                      onPressed: () {
                        showModalBottomSheet(
                          context: context,
                          shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
                          ),
                          backgroundColor: Colors.white,
                          isScrollControlled: true,
                          builder: (context) {
                            return DraggableScrollableSheet(
                              expand: false,
                              initialChildSize: 0.85,
                              minChildSize: 0.5,
                              maxChildSize: 0.95,
                              builder: (context, scrollController) {
                                return Padding(
                                  padding: const EdgeInsets.all(20),
                                  child: SingleChildScrollView(
                                    controller: scrollController,
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: const [
                                        Center(
                                          child: Icon(Icons.horizontal_rule, size: 32, color: Colors.grey),
                                        ),
                                        SizedBox(height: 8),
                                        Text(
                                          "Cara Berkomunikasi dengan Teman agar Lebih Saling Memahami",
                                          style: TextStyle(
                                            fontFamily: 'Poppins',
                                            fontWeight: FontWeight.bold,
                                            fontSize: 16,
                                          ),
                                        ),
                                        SizedBox(height: 12),
                                        Text(
                                          '''Komunikasi adalah kunci dalam membangun hubungan yang sehat dan saling pengertian. Berikut adalah beberapa tips agar komunikasi dengan teman menjadi lebih baik:

1. Dengarkan dengan Penuh Perhatian  
Berikan perhatian penuh saat temanmu berbicara. Jangan menyela dan hindari memikirkan jawaban saat mereka masih berbicara.

2. Gunakan Bahasa Tubuh yang Terbuka  
Tatapan mata, anggukan, dan ekspresi wajah yang ramah membantu menunjukkan bahwa kamu benar-benar peduli dan hadir.

3. Hindari Asumsi Negatif  
Jika ada hal yang tidak jelas, tanyakan langsung. Jangan langsung menyimpulkan atau menuduh.

4. Ungkapkan Perasaan dengan Jujur tapi Sopan  
Katakan bagaimana perasaanmu tanpa menyalahkan. Gunakan kalimat "aku merasa..." daripada "kamu selalu..."

5. Hormati Perbedaan Pendapat  
Tidak semua hal harus disetujui. Yang penting, kalian bisa tetap saling menghargai.

Dengan komunikasi yang sehat, hubungan pertemanan akan semakin kuat dan penuh pengertian. 🌟
''',
                                          style: TextStyle(
                                            fontFamily: 'Poppins',
                                            fontSize: 13.5,
                                            height: 1.6,
                                            color: Color(0xFF5D5555),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              },
                            );
                          },
                        );
                      },
                      icon: Image.asset('assets/button/book-icon.png', height: 18, width: 18),
                      label: const Text("Baca"),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                        foregroundColor: Colors.black,
                      ),
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 25),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _MenuButton(iconAsset: 'assets/button/beranda.png', active: true, onTap: () {}),
                _MenuButton(iconAsset: 'assets/button/konseling.png', onTap: () => Get.to(() => const KonselingView())),
                _MenuButton(iconAsset: 'assets/button/artikel-tips.png', onTap: () => Get.to(() => const ArtikelView())),
                _MenuButton(iconAsset: 'assets/button/kirim-pesan.png', onTap: () => Get.to(() => const KontakView())),
              ],
            ),
            const SizedBox(height: 25),
            Container(
              height: 160,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                image: const DecorationImage(
                  image: AssetImage('assets/asse/yt.png'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(height: 30),
            _SectionTitle(title: "Eksplorasi :", onViewAll: () => Get.to(() => const ExplorasiView())),
            const SizedBox(height: 15),
            Row(
              children: [
                Expanded(
                  child: GestureDetector(
                    onTap: () => Get.to(() => const ExplorasiView()),
                    child: const _EksplorasiCard(
                      imageAsset: 'assets/asse/eksplorasi-kelas.png',
                      text: "Merasa gugup saat harus berbicara di depan kelas itu wajar, kok.",
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: GestureDetector(
                    onTap: () => Get.to(() => const ExplorasiView()),
                    child: const _EksplorasiCard(
                      imageAsset: 'assets/asse/eksplorasi-istirahat.png',
                      text: "Saat tubuh dan pikiranmu lelah, istirahat bukan berarti malas, itu adalah kebutuhan.",
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 30),
            _SectionTitle(title: "Rekomendasi Guru BK :", onViewAll: () => Get.to(() => const GurubkView())),
            const SizedBox(height: 15),
            SizedBox(
              height: 80,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: const [
                  _GuruBKAvatar(imageAsset: 'assets/asse/guru-bk1.png'),
                  SizedBox(width: 15),
                  _GuruBKAvatar(imageAsset: 'assets/asse/guru-bk2.png'),
                  SizedBox(width: 15),
                  _GuruBKAvatar(imageAsset: 'assets/asse/guru-bk3.png'),
                  SizedBox(width: 15),
                  _GuruBKAvatar(imageAsset: 'assets/asse/guru-bk4.png'),
                  SizedBox(width: 15),
                  _GuruBKAvatar(imageAsset: 'assets/asse/guru-bk5.png'),
                  SizedBox(width: 15),
                  _GuruBKAvatar(imageAsset: 'assets/asse/guru-bk6.png'),
                ],
              ),
            ),
            const SizedBox(height: 30),
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
                _NavBarItem(icon: Icons.person_outline, isActive: _selectedIndex == 0, onTap: () => _onItemTapped(0)),
                _NavBarItem(icon: Icons.home, isActive: _selectedIndex == 1, onTap: () => _onItemTapped(1)),
                _NavBarItem(icon: Icons.chat_bubble_outline, isActive: _selectedIndex == 2, onTap: () => _onItemTapped(2)),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// _MenuButton, _NavBarItem, _EksplorasiCard, _GuruBKAvatar, _SectionTitle (no changes made)

class _MenuButton extends StatelessWidget {
  final String iconAsset;
  final bool active;
  final VoidCallback? onTap;

  const _MenuButton({required this.iconAsset, this.active = false, this.onTap});

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
          border: Border.all(color: active ? const Color(0xFF9BC55F) : Colors.grey.withOpacity(0.2), width: 2),
        ),
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Image.asset(iconAsset, color: Colors.white),
        ),
      ),
    );
  }
}

class _NavBarItem extends StatelessWidget {
  final IconData icon;
  final bool isActive;
  final VoidCallback onTap;

  const _NavBarItem({required this.icon, required this.isActive, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 50,
        height: 50,
        decoration: BoxDecoration(color: isActive ? Colors.white : const Color(0xFF8EA76C), shape: BoxShape.circle),
        child: Icon(icon, color: isActive ? const Color(0xFFB4D678) : Colors.white, size: 26),
      ),
    );
  }
}

class _EksplorasiCard extends StatelessWidget {
  final String imageAsset;
  final String text;

  const _EksplorasiCard({required this.imageAsset, required this.text});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          height: 180,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            image: DecorationImage(image: AssetImage(imageAsset), fit: BoxFit.cover),
          ),
        ),
        const SizedBox(height: 8),
        Text(
          text,
          style: const TextStyle(fontFamily: 'Poppins', fontSize: 13, color: Color(0xFF5D5555), fontWeight: FontWeight.w500),
          maxLines: 3,
          overflow: TextOverflow.ellipsis,
        ),
      ],
    );
  }
}

class _GuruBKAvatar extends StatelessWidget {
  final String imageAsset;

  const _GuruBKAvatar({required this.imageAsset});

  @override
  Widget build(BuildContext context) {
    return ClipOval(
      child: Image.asset(imageAsset, width: 80, height: 80, fit: BoxFit.cover),
    );
  }
}

class _SectionTitle extends StatelessWidget {
  final String title;
  final VoidCallback onViewAll;

  const _SectionTitle({required this.title, required this.onViewAll});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(title, style: const TextStyle(fontFamily: 'Poppins', fontSize: 18, fontWeight: FontWeight.w600, color: Color(0xFF5D5555))),
        GestureDetector(
          onTap: onViewAll,
          child: Row(
            children: const [
              Text("View All", style: TextStyle(fontFamily: 'Poppins', fontSize: 14, color: Color(0xFF5D5555))),
              Icon(Icons.chevron_right, color: Color(0xFF5D5555)),
            ],
          ),
        ),
      ],
    );
  }
}
