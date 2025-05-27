import 'package:flutter/material.dart';
import 'package:get/get.dart'; // untuk Get.toNamed
import 'package:konselink/app/modules/chat_list/views/chat_list_view.dart';

class ChatView extends StatelessWidget {
  const ChatView({Key? key}) : super(key: key);

  final List<Map<String, String>> chats = const [
    {
      "name": "Ibu Ratih Rahmawati, S.Pd.",
      "message": "Halo, bagaimana kabarmu? Jangan lupa.. ",
      "time": "5 min ago",
      "unread": "1",
      "image": "assets/asse/guru-bk1.png",
    },
    {
      "name": "Dr. Rina, M.Psi., Psikolog",
      "message": "Halo, bagaimana kabarmu?",
      "time": "10 min ago",
      "unread": "2",
      "image": "assets/asse/guru-bk6.png",
    },
    {
      "name": " Ibu Maya Lestari, M.Psi.",
      "message": "Jangan lupa konsultasi ya! Hari ini jadwalnya",
      "time": "1 hr ago",
      "unread": "1",
      "image": "assets/asse/guru-bk2.png",
    },
    {
      "name": "Bu Nia Arifin, S.Psi., M.Pd.",
      "message": "Wow, Keren. Hebat banget kamu!",
      "time": "2 hr ago",
      "unread": "3",
      "image": "assets/asse/guru-bk5.png",
    },
    {
      "name": "Bu Tania Oktaviani, M.Psi.",
      "message": "Semangat terus ya, kamu ga sendiri ko",
      "time": "Yesterday",
      "unread": "0",
      "image": "assets/asse/guru-bk3.png",
    },
  ];

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
      backgroundColor: const Color(0xFFF8F9FA),
      body: SafeArea(
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              decoration: const BoxDecoration(
                color: Color(0xFFB4D678),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(35),
                  bottomRight: Radius.circular(35),
                ),
              ),
              child: Row(
                children: [
                  IconButton(
                    icon: const Icon(
                      Icons.arrow_back_ios_new,
                      color: Colors.white,
                      size: 20,
                    ),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                  const SizedBox(width: 16),
                  const Expanded(
                    child: Text(
                      "Pesan",
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        letterSpacing: 0.5,
                      ),
                    ),
                  ),
                  const SizedBox(width: 16),
                ],
              ),
            ),

            Expanded(
              child: Container(
                margin: const EdgeInsets.only(top: 20),
                child: ListView.builder(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  itemCount: chats.length,
                  itemBuilder: (context, index) {
                    final chat = chats[index];
                    final hasUnread = chat['unread'] != '0';

                    return GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const ChatListView()),
                        );
                      },
                      child: Container(
                        margin: const EdgeInsets.only(bottom: 16),
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(25),
                          border: hasUnread
                              ? Border.all(color: const Color(0xFFB4D678).withOpacity(0.3), width: 1.5)
                              : null,
                          boxShadow: [
                            BoxShadow(
                              color: hasUnread
                                  ? const Color(0xFFB4D678).withOpacity(0.15)
                                  : Colors.black.withOpacity(0.08),
                              blurRadius: hasUnread ? 15 : 10,
                              offset: const Offset(0, 4),
                              spreadRadius: hasUnread ? 1 : 0,
                            ),
                          ],
                        ),
                        child: Row(
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(
                                  color: const Color(0xFFB4D678).withOpacity(0.3),
                                  width: 2,
                                ),
                                boxShadow: [
                                  BoxShadow(
                                    color: const Color(0xFFB4D678).withOpacity(0.2),
                                    blurRadius: 8,
                                    offset: const Offset(0, 2),
                                  ),
                                ],
                              ),
                              child: CircleAvatar(
                                backgroundImage: AssetImage(chat['image']!),
                                radius: 28,
                              ),
                            ),
                            const SizedBox(width: 16),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    chat['name']!,
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16,
                                      color: hasUnread ? const Color(0xFF2D5016) : const Color(0xFF333333),
                                      letterSpacing: 0.2,
                                    ),
                                  ),
                                  const SizedBox(height: 6),
                                  Text(
                                    chat['message']!,
                                    style: TextStyle(
                                      color: hasUnread ? const Color(0xFF4A4A4A) : const Color(0xFF888888),
                                      fontSize: 14,
                                      fontWeight: hasUnread ? FontWeight.w500 : FontWeight.normal,
                                    ),
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ],
                              ),
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  chat['time']!,
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: hasUnread ? const Color(0xFF666666) : const Color(0xFF999999),
                                    fontWeight: hasUnread ? FontWeight.w500 : FontWeight.normal,
                                  ),
                                ),
                                const SizedBox(height: 8),
                                if (hasUnread)
                                  Container(
                                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                                    decoration: BoxDecoration(
                                      gradient: const LinearGradient(
                                        colors: [Color(0xFFFF6B6B), Color(0xFFFF5252)],
                                        begin: Alignment.topLeft,
                                        end: Alignment.bottomRight,
                                      ),
                                      borderRadius: BorderRadius.circular(12),
                                      boxShadow: [
                                        BoxShadow(
                                          color: const Color(0xFFFF5252).withOpacity(0.3),
                                          blurRadius: 6,
                                          offset: const Offset(0, 2),
                                        ),
                                      ],
                                    ),
                                    child: Text(
                                      chat['unread']!,
                                      style: const TextStyle(
                                        color: Colors.white,
                                        fontSize: 12,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  )
                                else
                                  const SizedBox(height: 20),
                              ],
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),

      // ✅ Tambahan Bottom Navigation Bar
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

// ✅ Komponen Navbar Item
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
