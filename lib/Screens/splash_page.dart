import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:video_app/Screens/Intros/1.dart';
import 'package:video_app/Utilities/colors.dart';
import 'package:video_app/Utilities/images.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  void initState() {
    Timer(
      Duration(seconds: 3),
      () {
        Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (BuildContext context) => Intro1()));
      },
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgcolor,
      body: Container(
        height: Get.height,
        width: Get.width,
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage(AppImage.images + "splash.png"),
                fit: BoxFit.cover)),
      ),
    );
  }
}
