import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'app/routes/app_pages.dart';
import 'app/widgets/splash.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: Future.delayed(Duration(seconds: 5)),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting){
          return SplashScreen();
        } 
        else {
          return GetMaterialApp(
            debugShowCheckedModeBanner: false, // ✅ Tambahkan ini
            title: "Application",
            initialRoute: Routes.WELCOME,
            getPages: AppPages.routes,
          );
        }
      },
    );
  }
}
