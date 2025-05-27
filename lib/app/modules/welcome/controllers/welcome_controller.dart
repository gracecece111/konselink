import 'package:flutter/material.dart';
import 'package:get/get.dart';

class WelcomeController extends GetxController with GetSingleTickerProviderStateMixin {
  late AnimationController animationController;

  late Animation<double> fadeAnimation;
  late Animation<Offset> titleSlideAnimation;
  late Animation<double> scaleAnimation;
  late Animation<Offset> descriptionSlideAnimation;
  late Animation<double> descriptionFadeAnimation;
  late Animation<double> madeByFadeAnimation;
  late Animation<double> buttonFadeAnimation;
  late Animation<double> buttonAnimation;

  @override
  void onInit() {
    super.onInit();

    animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1200),
    );

    fadeAnimation = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(parent: animationController, curve: const Interval(0.0, 0.4)),
    );

    titleSlideAnimation = Tween<Offset>(begin: const Offset(0, -0.2), end: Offset.zero).animate(
      CurvedAnimation(parent: animationController, curve: const Interval(0.0, 0.4, curve: Curves.easeOut)),
    );

    scaleAnimation = Tween<double>(begin: 0.8, end: 1.0).animate(
      CurvedAnimation(parent: animationController, curve: const Interval(0.2, 0.6, curve: Curves.easeOutBack)),
    );

    descriptionFadeAnimation = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(parent: animationController, curve: const Interval(0.4, 0.6)),
    );

    descriptionSlideAnimation = Tween<Offset>(begin: const Offset(0, 0.2), end: Offset.zero).animate(
      CurvedAnimation(parent: animationController, curve: const Interval(0.4, 0.6, curve: Curves.easeOut)),
    );

    madeByFadeAnimation = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(parent: animationController, curve: const Interval(0.6, 0.8)),
    );

    buttonFadeAnimation = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(parent: animationController, curve: const Interval(0.7, 1.0)),
    );

    buttonAnimation = Tween<double>(begin: 0, end: 0.05).animate(
      CurvedAnimation(parent: animationController, curve: Curves.elasticOut),
    );

    animationController.forward();
  }

  @override
  void onClose() {
    animationController.dispose();
    super.onClose();
  }
}
