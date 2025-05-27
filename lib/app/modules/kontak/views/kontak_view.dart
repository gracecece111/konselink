import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:konselink/app/modules/home/views/home_view.dart';
import 'package:konselink/app/modules/konseling/views/konseling_view.dart';
import 'package:konselink/app/modules/artikel/views/artikel_view.dart';

class KontakView extends StatefulWidget {
  const KontakView({super.key});

  @override
  State<KontakView> createState() => _KontakViewState();
}

class _KontakViewState extends State<KontakView> {
  final TextEditingController namaController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController pesanController = TextEditingController();
  final TextEditingController kejadianController = TextEditingController();
  final TextEditingController pelakuController = TextEditingController();
  final TextEditingController lokasiWaktuController = TextEditingController();
  final TextEditingController tindakLanjutController = TextEditingController();

  void _onItemTapped(int index) {
    switch (index) {
      case 0:
        break;
      case 1:
        Get.to(() => const HomeView());
        break;
      case 2:
        Get.to(() => const KonselingView());
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8FAF5),
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
              Color(0xFFF8FAF5),
              Color(0xFFF0F5F0),
            ],
          ),
        ),
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.symmetric(vertical: 8),
                child: RichText(
                  text: const TextSpan(
                    style: TextStyle(fontFamily: 'Poppins', fontSize: 22),
                    children: [
                      TextSpan(
                        text: "Hai, ",
                        style: TextStyle(
                          color: Color(0xFF8DC63F),
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      TextSpan(
                        text: "ada yang ingin\nkamu tanyakan?",
                        style: TextStyle(
                          color: Color(0xFF5D5555),
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 5),
              Container(
                padding: const EdgeInsets.symmetric(vertical: 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    _MenuButton(
                      iconAsset: 'assets/button/beranda.png',
                      onTap: () => Get.to(() => const HomeView()),
                    ),
                    _MenuButton(
                      iconAsset: 'assets/button/konseling.png',
                      onTap: () => Get.to(() => const KonselingView()),
                    ),
                    _MenuButton(
                      iconAsset: 'assets/button/artikel-tips.png',
                      onTap: () => Get.to(() => const ArtikelView()),
                    ),
                    _MenuButton(
                      iconAsset: 'assets/button/kirim-pesan.png',
                      active: true,
                      onTap: () {},
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 36),
              const Text(
                "Hubungi Kami",
                style: TextStyle(
                  fontFamily: 'Poppins',
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                  color: Color(0xFF5D5555),
                ),
              ),
              const SizedBox(height: 16),
              _buildContactCard(
                icon: Icons.email_outlined,
                label: "E-mail",
                value: "smpalirsyadmlg@gmail.com",
              ),
              const SizedBox(height: 14),
              _buildContactCard(
                icon: Icons.phone_outlined,
                label: "Telp",
                value: "+62 341 3014698",
              ),
              const SizedBox(height: 14),
              _buildContactCard(
                icon: Icons.location_on_outlined,
                label: "Lokasi",
                value: "Jl. Arif Margono No.11\nKota Malang, Jawa Timur",
              ),
              const SizedBox(height: 36),
              Container(
                padding: const EdgeInsets.all(24),
                margin: const EdgeInsets.only(bottom: 20),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.06),
                      blurRadius: 15,
                      offset: const Offset(0, 5),
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Kirim Pesan",
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                        color: Color(0xFF5D5555),
                      ),
                    ),
                    const SizedBox(height: 20),
                    _buildTextField(label: "Nama", controller: namaController),
                    const SizedBox(height: 18),
                    _buildTextField(label: "Email", controller: emailController),
                    const SizedBox(height: 18),
                    _buildTextField(label: "Pesan", controller: pesanController, maxLines: 5),
                    const SizedBox(height: 28),
                    _buildTextField(label: "Apa yang terjadi", controller: kejadianController, maxLines: 4),
                    const SizedBox(height: 18),
                    _buildTextField(label: "Siapa saja yang terlibat (opsional)", controller: pelakuController),
                    const SizedBox(height: 18),
                    _buildTextField(label: "Di mana dan kapan kejadiannya", controller: lokasiWaktuController),
                    const SizedBox(height: 18),
                    _buildTextField(label: "Apakah butuh ditindak lanjut", controller: tindakLanjutController),
                    const SizedBox(height: 28),
                    SizedBox(
                      width: double.infinity,
                      height: 52,
                      child: ElevatedButton(
                        onPressed: () {
                          // Tambahkan logika pengiriman pesan di sini
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFF8DC63F),
                          foregroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(26),
                          ),
                        ),
                        child: const Text(
                          "Kirim Pesan",
                          style: TextStyle(
                            fontFamily: 'Poppins',
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
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
      bottomNavigationBar: ClipRRect(
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        ),
        child: BottomAppBar(
          color: const Color(0xFFB4D678),
          child: SizedBox(
            height: 60,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                _NavBarItem(
                  icon: Icons.person_outline,
                  isActive: false,
                  onTap: () => _onItemTapped(0),
                ),
                _NavBarItem(
                  icon: Icons.home,
                  isActive: false,
                  onTap: () => _onItemTapped(1),
                ),
                _NavBarItem(
                  icon: Icons.chat_bubble_outline,
                  isActive: false,
                  onTap: () => _onItemTapped(2),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildContactCard({
    required IconData icon,
    required String label,
    required String value,
  }) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.06),
            blurRadius: 12,
            offset: const Offset(0, 4),
          ),
        ],
        border: Border.all(
          color: const Color(0xFF8DC63F).withOpacity(0.1),
        ),
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  const Color(0xFF8DC63F).withOpacity(0.15),
                  const Color(0xFF8DC63F).withOpacity(0.05),
                ],
              ),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(
              icon,
              color: const Color(0xFF8DC63F),
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(label,
                    style: const TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 13,
                      color: Color(0xFF888888),
                      fontWeight: FontWeight.w500,
                    )),
                const SizedBox(height: 4),
                Text(value,
                    style: const TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 15,
                      color: Color(0xFF5D5555),
                      fontWeight: FontWeight.w600,
                    )),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTextField({
    required String label,
    required TextEditingController controller,
    int maxLines = 1,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(
            fontFamily: 'Poppins',
            fontSize: 14,
            fontWeight: FontWeight.w600,
            color: Color(0xFF5D5555),
          ),
        ),
        const SizedBox(height: 8),
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.04),
                blurRadius: 8,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          child: TextField(
            controller: controller,
            maxLines: maxLines,
            style: const TextStyle(
              fontFamily: 'Poppins',
              fontSize: 15,
              color: Color(0xFF5D5555),
            ),
            decoration: InputDecoration(
              hintText: "Masukkan $label...",
              filled: true,
              fillColor: const Color(0xFFFAFCF7),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide(color: Colors.grey.withOpacity(0.2)),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: const BorderSide(color: Color(0xFF8DC63F), width: 2),
              ),
              contentPadding: EdgeInsets.symmetric(
                horizontal: 16,
                vertical: maxLines > 1 ? 16 : 14,
              ),
            ),
          ),
        ),
      ],
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
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 8,
              offset: const Offset(0, 2),
              spreadRadius: 1,
            )
          ],
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
        ),
      ),
    );
  }
}
