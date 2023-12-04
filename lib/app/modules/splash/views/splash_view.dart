// ignore_for_file: use_super_parameters

import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/splash_controller.dart';

class SplashView extends GetView<SplashController> {
  const SplashView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const Center(
        //TODO:https: https://youtu.be/k_CvQl_IDl8?si=C98Xb106aBAQE99S&t=306
        child: Text(
          'SplashView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
