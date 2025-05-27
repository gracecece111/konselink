import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:konselink/app/modules/status/views/status_view.dart';

class JadwalView extends StatefulWidget {
  const JadwalView({super.key});

  @override
  State<JadwalView> createState() => _JadwalViewState();
}

class _JadwalViewState extends State<JadwalView> {
  void _onItemTapped(int index) {
  if (index == 0) {
    Get.toNamed('/profile');
  } else if (index == 1) {
    Get.toNamed('/home'); // Navigasi ke halaman Home
  } else if (index == 2) {
    Get.toNamed('/chat');
  }
}

  String? selectedGuru;
  String selectedJenis = 'Akademik';
  DateTime selectedDate = DateTime(2025, 5, 27); // Selasa, 27 Mei 2025
  String? selectedTime;
  int currentMonth = 5; // Mei
  int currentYear = 2025;

  final List<String> guruList = [
    'Ibu Ratih Rahmawati, S.Pd.',
    'Dr. Rina, M.Psi., Psikolog'
  ];

  final List<String> jenisList = ['Pribadi', 'Akademik', 'Karir', 'Keluarga', 'Kelompok', 'Sosial', 'Mental', 'Kesehatan', 'Spiritual', ];
  final List<String> waktuList = [
    '08.00',
    '09.00',
    '09.30',
    '11.00',
    '11.30',
    '13.00',
  ];

  // Tanggal yang tersedia untuk konsultasi
  final Set<DateTime> availableDates = {
    DateTime(2025, 5, 18), // Minggu, 18 Mei 2025
    DateTime(2025, 5, 24), // Sabtu, 24 Mei 2025
    DateTime(2025, 5, 27), // Selasa, 27 Mei 2025
    DateTime(2025, 5, 30), // Jumat, 30 Mei 2025
  };

  final List<String> monthNames = [
    'Januari', 'Februari', 'Maret', 'April', 'Mei', 'Juni',
    'Juli', 'Agustus', 'September', 'Oktober', 'November', 'Desember'
  ];

  final List<String> dayNames = ['Sen', 'Sel', 'Rab', 'Kam', 'Jum', 'Sab', 'Min'];

  // Fungsi untuk mendapatkan hari pertama dalam bulan
  int getFirstDayOfMonth(int year, int month) {
    DateTime firstDay = DateTime(year, month, 1);
    return firstDay.weekday == 7 ? 0 : firstDay.weekday;
  }

  // Fungsi untuk mendapatkan jumlah hari dalam bulan
  int getDaysInMonth(int year, int month) {
    return DateTime(year, month + 1, 0).day;
  }

  // Fungsi untuk mengecek apakah tanggal tersedia
  bool isDateAvailable(DateTime date) {
    return availableDates.any((d) =>
        d.year == date.year &&
        d.month == date.month &&
        d.day == date.day);
  }

  // Widget untuk membangun kalender kustom
  Widget buildCustomCalendar() {
  int daysInMonth = getDaysInMonth(currentYear, currentMonth);
  int firstDayOfWeek = getFirstDayOfMonth(currentYear, currentMonth);
  
  List<Widget> dayWidgets = [];

  final Set<DateTime> redDates = {
  DateTime(2025, 5, 20),
  DateTime(2025, 5, 28),
};


  // Header hari
  for (String dayName in dayNames) {
    dayWidgets.add(
      Container(
        height: 30,
        alignment: Alignment.center,
        child: Text(
          dayName,
          style: const TextStyle(
            fontFamily: 'Poppins',
            fontSize: 12,
            fontWeight: FontWeight.w500,
            color: Colors.grey,
          ),
        ),
      ),
    );
  }

  // Hari kosong di awal bulan
  for (int i = 0; i < firstDayOfWeek; i++) {
    dayWidgets.add(Container());
  }

  // Hari-hari dalam bulan
  for (int day = 1; day <= daysInMonth; day++) {
    DateTime date = DateTime(currentYear, currentMonth, day);
    bool isSelected = selectedDate.year == date.year &&
        selectedDate.month == date.month &&
        selectedDate.day == date.day;
    bool isRed = redDates.any((d) =>
        d.year == date.year &&
        d.month == date.month &&
        d.day == date.day);

    dayWidgets.add(
      GestureDetector(
        onTap: () {
          setState(() {
            selectedDate = date;
          });
        },
        child: Container(
          height: 40,
          margin: const EdgeInsets.all(1),
          decoration: BoxDecoration(
            color: isSelected 
                ? const Color(0xFFB4D678)
                : Colors.white,
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: Colors.grey.shade300),
          ),
          alignment: Alignment.center,
          child: Text(
            '$day',
            style: TextStyle(
              fontFamily: 'Poppins',
              fontSize: 14,
              fontWeight: FontWeight.w500,
              color: isSelected
                  ? Colors.white
                  : isRed
                      ? Colors.red
                      : Color(0xFF5D5555),
            ),
          ),
        ),
      ),
    );
  }

  return Container(
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(12),
      border: Border.all(color: Colors.grey.shade300),
    ),
    padding: const EdgeInsets.all(16),
    child: Column(
      children: [
        // Header bulan dan tahun dengan navigasi
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
              onPressed: () {
                setState(() {
                  if (currentMonth == 1) {
                    currentMonth = 12;
                    currentYear--;
                  } else {
                    currentMonth--;
                  }
                });
              },
              icon: const Icon(Icons.chevron_left, color: Colors.grey),
            ),
            Text(
              '${monthNames[currentMonth - 1]} $currentYear',
              style: const TextStyle(
                fontFamily: 'Poppins',
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
            IconButton(
              onPressed: () {
                setState(() {
                  if (currentMonth == 12) {
                    currentMonth = 1;
                    currentYear++;
                  } else {
                    currentMonth++;
                  }
                });
              },
              icon: const Icon(Icons.chevron_right, color: Colors.grey),
            ),
          ],
        ),
        const SizedBox(height: 16),
        GridView.count(
          crossAxisCount: 7,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          children: dayWidgets,
        ),
      ],
    ),
  );
}

  // Custom Success Modal
  void showSuccessModal(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => Dialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        child: Container(
          padding: const EdgeInsets.all(24),
          decoration: BoxDecoration(
            gradient: const LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [Color(0xFFB4D678), Color(0xFF9BC55A)],
            ),
            borderRadius: BorderRadius.circular(20),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // Character illustration
            Container(
              width: 200,
              height: 200,
              child: Image.asset(
                'assets/logo/logo-splash.png', // ganti sesuai path asetmu
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 5),
              
              // Success message container
              Container(
                padding: const EdgeInsets.all(25),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Column(
                  children: [
                    const Text(
                      'Kamu sudah berhasil mengajukan permintaan konsultasi.',
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: Color(0xFFB4D678),
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 8),
                    const Text(
                      'Tunggu ya... Guru BK akan memproses permintaanmu.',
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                        color: Colors.grey,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 16),
                    const Text(
                      'Kamu bisa lihat statusnya di menu Riwayat & Status.',
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                        color: Color(0xFF5D5555),
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 20),
                    
                    // Buttons
                    Column(
                      children: [
                        SizedBox(
                          width: double.infinity,
                          child: ElevatedButton(
                            onPressed: () {
                              Get.to(() => StatusView()); // Pindahkan fungsi di sini
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: const Color(0xFFB4D678),
                              foregroundColor: Colors.white,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                              padding: const EdgeInsets.symmetric(vertical: 12),
                            ),
                            child: const Text(
                              'Status & Riwayat',
                              style: TextStyle(
                                fontFamily: 'Poppins',
                                fontSize: 12,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 8),
                        SizedBox(
                          width: double.infinity,
                          child: ElevatedButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.grey.shade200,
                              foregroundColor: const Color(0xFFB4D678),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                              padding: const EdgeInsets.symmetric(vertical: 12),
                            ),
                            child: const Text(
                              'Kembali',
                              style: TextStyle(
                                fontFamily: 'Poppins',
                                fontSize: 12,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ),
                        ),
                      ],
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


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text(''),
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 16),
            child: Icon(Icons.notifications_none, color: Color(0xFF5D5555)),
          ),
        ],
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: SafeArea(
  child: Padding(
    padding: const EdgeInsets.all(20),
    child: SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
              // Header text
              const Text.rich(
                TextSpan(
                  children: [
                    TextSpan(
                      text: "Yuk, ",
                      style: TextStyle(color: Color(0xFF5D5555), fontFamily: 'Poppins',),
                    ),
                    TextSpan(
                      text: "atur waktu ",
                      style: TextStyle(color: Color(0xFFB4D678), fontFamily: 'Poppins',),
                    ),
                    TextSpan(
                      text: "konsultasimu di sini!",
                      style: TextStyle(color: Color(0xFF5D5555), fontFamily: 'Poppins',),
                    ),
                  ],
                ),
                style: TextStyle(
                  fontFamily: 'Poppins',
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 20),

              // Pilih Guru BK
              const Text(
                "Pilih Guru BK :",
                style: TextStyle(
                  fontFamily: 'Poppins',
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 8),
              DropdownButtonFormField<String>(
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  hintText: "Pilih Guru BK",
                  hintStyle: const TextStyle(color: Colors.grey),
                  contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(color: Colors.grey.shade300),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: const BorderSide(color: Color(0xFFB4D678)),
                  ),
                ),
                value: selectedGuru,
                icon: const Icon(Icons.keyboard_arrow_down, color: Colors.grey),
                items: guruList
                    .map((guru) => DropdownMenuItem(
                          value: guru,
                          child: Text(
                            guru,
                            style: const TextStyle(fontFamily: 'Poppins'),
                          ),
                        ))
                    .toList(),
                onChanged: (value) {
                  setState(() {
                    selectedGuru = value;
                  });
                },
              ),
              const SizedBox(height: 20),

              // Pilih Jenis Konseling
              const Text(
                "Pilih Jenis Konseling :",
                style: TextStyle(
                  fontFamily: 'Poppins',
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 8),
              SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child : Row(
                children: jenisList.map((jenis) {
                  final selected = jenis == selectedJenis;
                  return Container(
                    margin: const EdgeInsets.only(right: 8),
                    child: ElevatedButton(
                      onPressed: () {
                        setState(() {
                          selectedJenis = jenis;
                        });
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: selected ? const Color(0xFFB4D678) : Colors.white,
                        foregroundColor: selected ? Colors.white : Colors.black,
                        side: BorderSide(
                          color: selected ? const Color(0xFFB4D678) : Colors.grey.shade300,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        elevation: 0,
                        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                      ),
                      child: Text(
                        jenis,
                        style: const TextStyle(
                          fontFamily: 'Poppins',
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  );
                  }).toList(),
                  ),
                ),
              
              const SizedBox(height: 20),

              // Pilih Hari & Tanggal
              const Text(
                "Pilih Hari & Tanggal :",
                style: TextStyle(
                  fontFamily: 'Poppins',
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 8),
              buildCustomCalendar(),
              const SizedBox(height: 20),

              // Pilih Waktu
              const Text(
                "Pilih Waktu :",
                style: TextStyle(
                  fontFamily: 'Poppins',
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 8),
              Wrap(
                spacing: 10,
                runSpacing: 10,
                children: waktuList.map((waktu) {
                  final selected = waktu == selectedTime;
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedTime = waktu;
                      });
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                      decoration: BoxDecoration(
                        color: selected ? const Color(0xFFB4D678) : Colors.white,
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(
                          color: selected ? const Color(0xFFB4D678) : Colors.grey.shade300,
                        ),
                      ),
                      child: Text(
                        waktu,
                        style: TextStyle(
                          color: selected ? Colors.white : Colors.black,
                          fontFamily: 'Poppins',
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  );
                }).toList(),
              ),
              const SizedBox(height: 20),  // ganti Spacer dengan SizedBox saja

             // Button Ajukan Permintaan versi gambar
              GestureDetector(
                onTap: () {
                  // Validasi input
                  if (selectedGuru == null) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Pilih Guru BK terlebih dahulu')),
                    );
                    return;
                  }
                  if (selectedTime == null) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Pilih waktu konsultasi')),
                    );
                    return;
                  }

                  // Show custom success modal
                  showSuccessModal(context);
                },
                child: SizedBox(
                  width: double.infinity,
                  height: 48,
                  child: Image.asset(
                    'assets/button/ajukan.png', // Ganti path sesuai asset kamu
                    fit: BoxFit.cover,
                  ),
                ),
              )
            ]
          ),
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

