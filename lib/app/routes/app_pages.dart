import 'package:get/get.dart';

import '../modules/artikel/bindings/artikel_binding.dart';
import '../modules/artikel/views/artikel_view.dart';
import '../modules/chat/bindings/chat_binding.dart';
import '../modules/chat/views/chat_view.dart';
import '../modules/chat_list/bindings/chat_list_binding.dart';
import '../modules/chat_list/views/chat_list_view.dart';
import '../modules/explorasi/bindings/explorasi_binding.dart';
import '../modules/explorasi/views/explorasi_view.dart';
import '../modules/gurubk/bindings/gurubk_binding.dart';
import '../modules/gurubk/views/gurubk_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/jadwal/bindings/jadwal_binding.dart';
import '../modules/jadwal/views/jadwal_view.dart';
import '../modules/kategori1/bindings/kategori1_binding.dart';
import '../modules/kategori1/views/kategori1_view.dart';
import '../modules/konseling/bindings/konseling_binding.dart';
import '../modules/konseling/views/konseling_view.dart';
import '../modules/kontak/bindings/kontak_binding.dart';
import '../modules/kontak/views/kontak_view.dart';
import '../modules/login/bindings/login_binding.dart';
import '../modules/login/views/login_view.dart';
import '../modules/mood/bindings/mood_binding.dart';
import '../modules/mood/views/mood_view.dart';
import '../modules/notifikasi/bindings/notifikasi_binding.dart';
import '../modules/notifikasi/views/notifikasi_view.dart';
import '../modules/pilihan/bindings/pilihan_binding.dart';
import '../modules/pilihan/views/pilihan_view.dart';
import '../modules/profile/bindings/profile_binding.dart';
import '../modules/profile/views/profile_view.dart';
import '../modules/signup/bindings/signup_binding.dart';
import '../modules/signup/views/signup_view.dart';
import '../modules/status/bindings/status_binding.dart';
import '../modules/status/views/status_view.dart';
import '../modules/welcome/bindings/welcome_binding.dart';
import '../modules/welcome/views/welcome_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.HOME;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.WELCOME,
      page: () => const WelcomeView(),
      binding: WelcomeBinding(),
    ),
    GetPage(
      name: _Paths.LOGIN,
      page: () => const LoginView(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: _Paths.PILIHAN,
      page: () => const PilihanView(),
      binding: PilihanBinding(),
    ),
    GetPage(
      name: _Paths.SIGNUP,
      page: () => const SignupView(),
      binding: SignupBinding(),
    ),
    GetPage(
      name: _Paths.MOOD,
      page: () => const MoodView(),
      binding: MoodBinding(),
    ),
    GetPage(
      name: _Paths.KONSELING,
      page: () => const KonselingView(),
      binding: KonselingBinding(),
    ),
    GetPage(
      name: _Paths.ARTIKEL,
      page: () => const ArtikelView(),
      binding: ArtikelBinding(),
    ),
    GetPage(
      name: _Paths.KONTAK,
      page: () => const KontakView(),
      binding: KontakBinding(),
    ),
    GetPage(
      name: _Paths.GURUBK,
      page: () => const GurubkView(),
      binding: GurubkBinding(),
    ),
    GetPage(
      name: _Paths.EXPLORASI,
      page: () => const ExplorasiView(),
      binding: ExplorasiBinding(),
    ),
    GetPage(
      name: _Paths.KATEGORI1,
      page: () => const Kategori1View(),
      binding: Kategori1Binding(),
    ),
    GetPage(
      name: _Paths.JADWAL,
      page: () => const JadwalView(),
      binding: JadwalBinding(),
    ),
    GetPage(
      name: _Paths.STATUS,
      page: () => const StatusView(),
      binding: StatusBinding(),
    ),
    GetPage(
      name: _Paths.CHAT,
      page: () => const ChatView(),
      binding: ChatBinding(),
    ),
    GetPage(
      name: _Paths.PROFILE,
      page: () => const ProfileView(),
      binding: ProfileBinding(),
    ),
    GetPage(
      name: _Paths.CHAT_LIST,
      page: () => const ChatListView(),
      binding: ChatListBinding(),
    ),
    GetPage(
      name: _Paths.NOTIFIKASI,
      page: () => const NotifikasiView(),
      binding: NotifikasiBinding(),
    ),
  ];
}
