import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:konselink/app/modules/chat/views/chat_view.dart';

class StatusView extends StatefulWidget {
  const StatusView({super.key});

  @override
  State<StatusView> createState() => _StatusViewState();
}

class _StatusViewState extends State<StatusView> {
  int _selectedIndex = 1; // Default to home (middle icon)

  void _onItemTapped(int index) {
    if (index == 0) {
      Get.toNamed('/profile');
    } else if (index == 1) {
      Get.toNamed('/home');
    } else if (index == 2) {
      Get.toNamed('/chat');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
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
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Colors.white,
              Colors.white,
            ],
          ),
        ),
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header
              Container(
                padding: const EdgeInsets.symmetric(vertical: 8),
                child: RichText(
                  text: const TextSpan(
                    style: TextStyle(fontFamily: 'Poppins', fontSize: 22),
                    children: [
                      TextSpan(
                        text: "Status dan\n",
                        style: TextStyle(
                          color: Color(0xFF8DC63F),
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      TextSpan(
                        text: "Riwayat Konseling",
                        style: TextStyle(
                          color: Color(0xFF5D5555),
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 8),

              // Search
              const Text(
                'Cari Status & Riwayat Konseling',
                style: TextStyle(
                  fontFamily: 'Poppins',
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: Colors.black,
                ),
              ),
              const SizedBox(height: 8),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                decoration: BoxDecoration(
                  color: const Color(0xFF5D5555),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Row(
                  children: [
                    const Icon(Icons.search, color: Colors.white, size: 20),
                    const SizedBox(width: 8),
                    Expanded(
                      child: TextField(
                        style: const TextStyle(
                          color: Colors.white,
                          fontFamily: 'Poppins',
                          fontSize: 12,
                        ),
                        decoration: const InputDecoration(
                          hintText: 'Masukkan kata kunci...',
                          hintStyle: TextStyle(
                            color: Colors.white70,
                            fontFamily: 'Poppins',
                            fontSize: 12,
                          ),
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 24),
              const Text(
                'Status Permintaan :',
                style: TextStyle(
                  fontFamily: 'Poppins',
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: Colors.black,
                ),
              ),
              const SizedBox(height: 12),
              ..._buildStatusCards(context),

              const SizedBox(height: 24),
              const Text(
                'Riwayat Konseling :',
                style: TextStyle(
                  fontFamily: 'Poppins',
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: Colors.black,
                ),
              ),
              const SizedBox(height: 12),
              ..._buildHistoryCards(context),
            ],
          ),
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

  List<Widget> _buildStatusCards(BuildContext context) {
    final List<Map<String, dynamic>> statusList = [
      {
        'name': 'Ibu Ratih Rahmawati, S.Pd.',
        'jenis': 'Konseling Pribadi',
        'tanggal': '24 Mei 2025',
        'jam': '10.00 WIB',
        'status': 'Menunggu Konfirmasi',
        'button': 'Batalkan Permintaan',
        'avatar': 'assets/asse/guru-bk1.png',
        'statusColor': Colors.orange,
        'buttonColor': const Color(0xFFB4D678),
      },
      {
        'name': 'Ibu Maya Lestari, M.Psi.',
        'jenis': 'Konseling Akademik',
        'tanggal': '23 Mei 2025',
        'jam': '08.30 WIB',
        'status': 'Diterima',
        'button': 'Mulai Chat',
        'avatar': 'assets/asse/guru-bk2.png',
        'statusColor': const Color(0xFFB4D678),
        'buttonColor': const Color(0xFFB4D678),
      },
      {
        'name': 'Bu Nia Arifin, S.Psi., M.Pd.',
        'jenis': 'Konseling Pribadi',
        'tanggal': '22 Mei 2025',
        'jam': '11.30 WIB',
        'status': 'Dibatalkan',
        'button': 'Lihat Alasan',
        'avatar': 'assets/asse/guru-bk5.png',
        'statusColor': Colors.red,
        'buttonColor': const Color(0xFFB4D678),
      },
    ];

    return statusList.map((data) => _buildCard(context, data)).toList();
  }

  List<Widget> _buildHistoryCards(BuildContext context) {
    final List<Map<String, dynamic>> historyList = [
      {
        'name': 'Ibu Maya Lestari, M.Psi.',
        'jenis': 'Konseling Akademik',
        'tanggal': '20 Mei 2025',
        'jam': '09.00 WIB',
        'status': 'Konseling Selesai',
        'button': 'Beri Ulasan',
        'avatar': 'assets/asse/guru-bk2.png',
        'statusColor': const Color(0xFFB4D678),
        'buttonColor': const Color(0xFFB4D678),
      },
      {
        'name': 'Bu Tania Oktaviani, M.Psi.',
        'jenis': 'Konseling Pribadi',
        'tanggal': '18 Mei 2025',
        'jam': '10.30 WIB',
        'status': 'Konseling Selesai',
        'button': 'Beri Ulasan',
        'avatar': 'assets/asse/guru-bk6.png',
        'statusColor': const Color(0xFFB4D678),
        'buttonColor': const Color(0xFFB4D678),
      },
    ];

    return historyList.map((data) => _buildCard(context, data)).toList();
  }

  Widget _buildCard(BuildContext context, Map<String, dynamic> data) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(
          color: const Color(0xFFB4D678),
          width: 1.5,
        ),
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 1,
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 60,
            height: 60,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                color: const Color(0xFFB4D678),
                width: 2,
              ),
              color: const Color(0xFFB4D678).withOpacity(0.2),
            ),
            child: ClipOval(
              child: data['avatar'] != null
                  ? Image.asset(
                      data['avatar'],
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) {
                        return _buildAvatarPlaceholder(data['name']);
                      },
                    )
                  : _buildAvatarPlaceholder(data['name']),
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildTextLine("Guru BK", data['name'], isBold: true),
                _buildTextLine("Jenis", data['jenis']),
                _buildTextLine("Tanggal", data['tanggal'], isBold: true),
                _buildTextLine("Jam", data['jam'], isBold: true),
                const SizedBox(height: 4),
                Row(
                  children: [
                    const Text(
                      "Status : ",
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 11,
                        color: Colors.black,
                      ),
                    ),
                    Text(
                      data['status'],
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 11,
                        fontWeight: FontWeight.w500,
                        color: data['statusColor'] ?? Colors.grey,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: data['buttonColor'],
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  ),
                  onPressed: () {
                    if (data['button'] == 'Mulai Chat') {
                      Navigator.push(context, MaterialPageRoute(builder: (_) => ChatView()));
                    } else {
                      _showDialog(context, data['button']);
                    }
                  },
                  child: Text(
                    data['button'],
                    style: const TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTextLine(String label, String value, {bool isBold = false}) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 2),
      child: RichText(
        text: TextSpan(
          text: "$label : ",
          style: const TextStyle(
            fontFamily: 'Poppins',
            fontSize: 11,
            color: Colors.black,
          ),
          children: [
            TextSpan(
              text: value,
              style: TextStyle(
                fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
                color: Colors.black87,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildAvatarPlaceholder(String name) {
    List<String> nameParts = name.split(' ');
    String initials = '';
    if (nameParts.isNotEmpty) {
      initials = nameParts[0].isNotEmpty ? nameParts[0][0] : '';
      if (nameParts.length > 1 && nameParts[1].isNotEmpty) {
        initials += nameParts[1][0];
      }
    }

    return Container(
      decoration: const BoxDecoration(
        color: Color(0xFFB4D678),
        shape: BoxShape.circle,
      ),
      child: Center(
        child: Text(
          initials.toUpperCase(),
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 16,
            fontFamily: 'Poppins',
          ),
        ),
      ),
    );
  }

  void _showDialog(BuildContext context, String buttonText) {
    String title = '';
    String content = '';

    switch (buttonText) {
      case 'Batalkan Permintaan':
        title = 'Batalkan Permintaan';
        content = 'Apakah kamu yakin ingin membatalkan permintaan ini?';
        break;
      case 'Mulai Chat':
        title = 'Mulai Chat';
        content = 'Fitur chat belum tersedia saat ini.';
        break;
      case 'Lihat Alasan':
        title = 'Alasan Pembatalan';
        content = 'Permintaan dibatalkan karena jadwal penuh.';
        break;
      case 'Beri Ulasan':
        title = 'Ulasan Konseling';
        content = 'Silakan beri ulasan untuk sesi konseling ini.';
        break;
      default:
        title = 'Informasi';
        content = 'Aksi "$buttonText" belum ditangani.';
    }

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(
          title,
          style: const TextStyle(
            fontFamily: 'Poppins',
            fontWeight: FontWeight.bold,
          ),
        ),
        content: Text(
          content,
          style: const TextStyle(fontFamily: 'Poppins'),
        ),
        actions: buttonText == 'Batalkan Permintaan'
            ? [
                TextButton(
                  onPressed: () => Navigator.of(context).pop(),
                  child: const Text(
                    'Tidak',
                    style: TextStyle(fontFamily: 'Poppins'),
                  ),
                ),
                TextButton(
                  onPressed: () {
                    // TODO: Tambahkan logika pembatalan di sini
                    Navigator.of(context).pop();
                  },
                  child: const Text(
                    'Ya',
                    style: TextStyle(
                        fontFamily: 'Poppins', fontWeight: FontWeight.bold),
                  ),
                ),
              ]
            : [
                TextButton(
                  onPressed: () => Navigator.of(context).pop(),
                  child: const Text(
                    'Tutup',
                    style: TextStyle(fontFamily: 'Poppins'),
                  ),
                ),
              ],
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