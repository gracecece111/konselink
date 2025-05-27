import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:konselink/app/modules/jadwal/views/jadwal_view.dart';


class GurubkView extends StatefulWidget {
  const GurubkView({super.key});

  @override
  State<GurubkView> createState() => _GurubkViewState();
}

class _GurubkViewState extends State<GurubkView> {
  void _onItemTapped(int index) {
  if (index == 0) {
    Get.toNamed('/profile');
  } else if (index == 1) {
    Get.toNamed('/home'); // Navigasi ke halaman Home
  } else if (index == 2) {
    Get.toNamed('/chat');
  }
}


  final kategori = ['Pribadi', 'Akademik', 'Karir', 'Keluarga', 'Kelompok'];
  String selectedKategori = 'Pribadi';

  final List<Map<String, dynamic>> guruList = [
    {
      'nama': 'Ibu Ratih Rahmawati, S.Pd.',
      'spesialis': 'Konsel. Pribadi & Akademik',
      'rating': 5.5,
      'ulasan': 215,
      'image': 'assets/asse/guru-bk1.png'
    },
    {
      'nama': 'Dr. Rina, M.Psi., Psikolog',
      'spesialis': 'Konsel. Pribadi',
      'rating': 5.5,
      'ulasan': 200,
      'image': 'assets/asse/guru-bk6.png'
    },
    {
      'nama': 'Ibu Maya Lestari, M.Psi.',
      'spesialis': 'Konsel. Pribadi & Karir',
      'rating': 4.9,
      'ulasan': 130,
      'image': 'assets/asse/guru-bk4.png'
    },
    {
      'nama': 'Ibu Maya Lestari, M.Psi.',
      'spesialis': 'Konsel. Pribadi & Keluarga',
      'rating': 4.9,
      'ulasan': 100,
      'image': 'assets/asse/guru-bk2.png'
    },
    {
      'nama': 'Bu Nia Arifin, S.Psi., M.Pd.',
      'spesialis': 'Konsel. Pribadi',
      'rating': 4.9,
      'ulasan': 132,
      'image': 'assets/asse/guru-bk5.png'
    },
    {
      'nama': 'Bu Tania Oktaviani, M.Psi.',
      'spesialis': 'Konsel. Pribadi',
      'rating': 4.8,
      'ulasan': 145,
      'image': 'assets/asse/guru-bk3.png'
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
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
                  Align(
                    alignment: Alignment.centerLeft,
                    child: GestureDetector(
                      onTap: () => Get.back(),
                      child: const Icon(
                        Icons.arrow_back_ios_rounded,
                        size: 20,
                        color: Color(0xFF5D5555),
                      ),
                    ),
                  ),
                  const SizedBox(height: 24),
                  RichText(
                    textAlign: TextAlign.left,
                    text: const TextSpan(
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 24,
                        fontWeight: FontWeight.w700,
                        height: 1.3,
                      ),
                      children: [
                        TextSpan(
                          text: "Temukan ",
                          style: TextStyle(color: Color(0xFFB4D678)),
                        ),
                        TextSpan(
                          text: "Guru BK\nSesuai Kebutuhanmu",
                          style: TextStyle(color: Color(0xFF5D5555)),
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
                      "👩‍🏫 Konselor terpercaya siap membantumu",
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 13,
                        fontWeight: FontWeight.w500,
                        color: Color(0xFF5D5555),
                      ),
                      textAlign: TextAlign.left,
                    ),
                  ),
                ],
              ),
            ),

            // Konten
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Kategori filter
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: kategori.map((kat) {
                          final bool selected = kat == selectedKategori;
                          return Container(
                            margin: const EdgeInsets.only(right: 10),
                            child: ElevatedButton(
                              onPressed: () {
                                setState(() {
                                  selectedKategori = kat;
                                });
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: selected ? const Color(0xFFB4D678) : Colors.white,
                                foregroundColor: selected ? Colors.white : Colors.black,
                                elevation: 0,
                                padding: const EdgeInsets.symmetric(horizontal: 16),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20),
                                  side: BorderSide(
                                    color: selected
                                        ? const Color(0xFFB4D678)
                                        : Colors.grey.shade300,
                                  ),
                                ),
                              ),
                              child: Text(kat),
                            ),
                          );
                        }).toList(),
                      ),
                    ),
                    const SizedBox(height: 20),

                    // Daftar Guru
                    Expanded(
                      child: ListView.builder(
                        itemCount: guruList.length,
                        itemBuilder: (context, index) {
                          final guru = guruList[index];
                          return Container(
                            margin: const EdgeInsets.only(bottom: 16),
                            padding: const EdgeInsets.all(12),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(16),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.05),
                                  blurRadius: 8,
                                  offset: const Offset(0, 4),
                                ),
                              ],
                            ),
                            child: Row(
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(60),
                                  child: Image.asset(
                                    guru['image'],
                                    width: 70,
                                    height: 70,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                const SizedBox(width: 12),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        guru['nama'],
                                        style: const TextStyle(
                                          fontFamily: 'Poppins',
                                          fontWeight: FontWeight.w600,
                                          fontSize: 14,
                                          color: Color(0xFF5D5555),
                                        ),
                                      ),
                                      const SizedBox(height: 4),
                                      Text(
                                        'Spesialis: ${guru['spesialis']}',
                                        style: const TextStyle(
                                          fontFamily: 'Poppins',
                                          fontSize: 12,
                                          fontWeight: FontWeight.w500,
                                          color: Color(0xFFB4D678),
                                        ),
                                      ),
                                      const SizedBox(height: 4),
                                      Row(
                                        children: [
                                          const Icon(Icons.star, size: 14, color: Colors.amber),
                                          const SizedBox(width: 4),
                                          Text(
                                            '${guru['rating']}',
                                            style: const TextStyle(
                                              fontFamily: 'Poppins',
                                              fontSize: 12,
                                            ),
                                          ),
                                          const SizedBox(width: 4),
                                          Text(
                                            '(${guru['ulasan']} ulasan)',
                                            style: const TextStyle(
                                              fontFamily: 'Poppins',
                                              fontSize: 12,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                                ElevatedButton(
                                  onPressed: () {
                                    Get.to(() => const JadwalView());
                                  },
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: const Color(0xFFB4D678),
                                    foregroundColor: Colors.white,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                    padding: const EdgeInsets.symmetric(
                                      vertical: 8,
                                      horizontal: 8,
                                    ),
                                  ),
                                  child: const Text(
                                    'Mulai Konseling',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(fontSize: 12, height: 2, fontFamily: 'Poppins'),
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      // Bottom NavBar
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
