import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NotifikasiView extends StatefulWidget {
  const NotifikasiView({Key? key}) : super(key: key);

  @override
  State<NotifikasiView> createState() => _NotifikasiViewState();
}

class _NotifikasiViewState extends State<NotifikasiView> {
  void _onItemTapped(int index) {
    if (index == 0) {
      Get.toNamed('/profile');
    } else if (index == 1) {
      Get.toNamed('/home');
    } else if (index == 2) {
      Get.toNamed('/chat');
    }
  }

  Widget buildNotification({
    required Icon icon,
    required String title,
    required String subtitle,
    required String time,
    required Color color,
    Color? iconBackground,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.08),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 32,
            height: 32,
            decoration: BoxDecoration(
              color: iconBackground ?? Colors.white.withOpacity(0.3),
              shape: BoxShape.circle,
            ),
            child: Icon(
              icon.icon,
              color: Colors.white,
              size: 18,
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w600,
                    fontSize: 14,
                    color: Colors.white,
                    height: 1.3,
                  ),
                ),
                if (subtitle.isNotEmpty) ...[
                  const SizedBox(height: 4),
                  Text(
                    subtitle,
                    style: const TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 12,
                      color: Colors.white,
                      fontWeight: FontWeight.w400,
                      height: 1.3,
                    ),
                  ),
                ],
                const SizedBox(height: 8),
                Row(
                  children: [
                    Container(
                      width: 6,
                      height: 6,
                      decoration: const BoxDecoration(
                        color: Colors.lightGreen,
                        shape: BoxShape.circle,
                      ),
                    ),
                    const SizedBox(width: 6),
                    Text(
                      time,
                      style: const TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 11,
                        color: Colors.white70,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  String getFormattedDate() {
    return "Minggu, 25 Mei 2025";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8F8F8),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: const Color(0xFFF8F8F8),
        elevation: 0,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 4),
            Container(
              padding: const EdgeInsets.all(6),
              child: Image.asset(
                'assets/button/notif.png',
                width: 120,
                fit: BoxFit.contain,
              ),
            ),
          ],
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.close, color: Color(0xFF5D5555), size: 22),
            onPressed: () => Navigator.pop(context),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 8),
            Text(
              getFormattedDate(),
              style: const TextStyle(
                fontFamily: 'Poppins',
                color: Colors.grey,
                fontSize: 12,
                fontWeight: FontWeight.w400,
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              "Hari ini",
              style: TextStyle(
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w500,
                fontSize: 14,
                color: Color(0xFF5D5555),
              ),
            ),
            const SizedBox(height: 16),
            Expanded(
              child: ListView(
                children: [
                  buildNotification(
                    icon: const Icon(Icons.more_horiz),
                    title: "Permintaan Konseling Sedang Diproses.",
                    subtitle: "Cek di halaman Status & Riwayat.",
                    time: "2 jam yang lalu.",
                    color: Colors.grey.shade500,
                    iconBackground: Colors.grey.shade600,
                  ),
                  buildNotification(
                    icon: const Icon(Icons.check),
                    title: "Yeay! Permintaan konselingmu sudah diterima oleh Bu Ratna.",
                    subtitle: "Cek di halaman Status & Riwayat.",
                    time: "3 jam yang lalu.",
                    color: const Color(0xFF8BC34A),
                    iconBackground: const Color(0xFF7CB342),
                  ),
                  buildNotification(
                    icon: const Icon(Icons.close),
                    title: "Permintaanmu ditolak karena jadwal penuh. Silakan ajukan ulang di waktu lain ya.",
                    subtitle: "9 jam yang lalu.",
                    time: "9 jam yang lalu.",
                    color: const Color(0xFFE78787),
                    iconBackground: const Color(0xFFE78787),
                  ),
                  const SizedBox(height: 24),
                  const Text(
                    "Kemarin",
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w500,
                      fontSize: 14,
                      color: Color(0xFF5D5555),
                    ),
                  ),
                  const SizedBox(height: 16),
                  buildNotification(
                    icon: const Icon(Icons.chat_bubble_outline),
                    title: "Wah, ada balasan dari Bu Rina di ruang chat.",
                    subtitle: "Klik untuk membuka chat.",
                    time: "1 hari yang lalu.",
                    color: Colors.grey.shade500,
                    iconBackground: Colors.grey.shade600,
                  ),
                  buildNotification(
                    icon: const Icon(Icons.star_border),
                    title: "Beri ulasan di halaman Status & Riwayat.",
                    subtitle: "Klik untuk membuka ulasan.",
                    time: "1 hari yang lalu.",
                    color: Colors.grey.shade500,
                    iconBackground: Colors.grey.shade600,
                  ),
                  const SizedBox(height: 20),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: ClipRRect(
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        ),
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
          color: Color(0xFF8EA76C),
          shape: BoxShape.circle,
        ),
        child: Icon(
          icon,
          color: Colors.white,
          size: 26,
        ),
      ),
    );
  }
}
