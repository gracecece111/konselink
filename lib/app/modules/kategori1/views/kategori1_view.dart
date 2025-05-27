import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/kategori1_controller.dart';

class Kategori1View extends GetView<Kategori1Controller> {
  const Kategori1View({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Kategori1View'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'Kategori1View is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
