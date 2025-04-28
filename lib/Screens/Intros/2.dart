// ignore_for_file: prefer_interpolation_to_compose_strings

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:video_app/Screens/Intros/3.dart';

import '../../Utilities/colors.dart';
import '../../Utilities/common_widget.dart';
import '../../Utilities/images.dart';

class Intro2 extends StatefulWidget {
  const Intro2({super.key});

  @override
  State<Intro2> createState() => _Intro2State();
}

class _Intro2State extends State<Intro2> {
  PageController pageController = PageController(initialPage: 1);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgcolor,
      body: Center(
        child: Column(
          children: [
            SizedBox(height: Get.height * 0.1),
            CommonWidget().robotoText(
                text: "What mood are you in todays?",
                textColor: AppColors.textWhitecolor,
                textSize: 20.0,
                textWeight: FontWeight.w500),
            SizedBox(height: 15),
            SizedBox(
              width: Get.width * 0.9,
              child: CommonWidget().robotoText(
                  text:
                      "It is widely used for personal, professional, and educational purposes.",
                  textColor: AppColors.textWhitecolor.withOpacity(.7),
                  textSize: 15.0,
                  textAlign: TextAlign.center,
                  textWeight: FontWeight.w400),
            ),
            SizedBox(height: 30),
            Container(
              height: Get.height * 0.25,
              width: Get.width * 0.75,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(AppImage.images + "2.png"),
                      fit: BoxFit.contain)),
            ),
            Spacer(),
            SmoothPageIndicator(
              controller: pageController,
              count: 9,
              effect: ScaleEffect(
                  dotHeight: 8,
                  dotWidth: 8,
                  spacing: 4,
                  activeDotColor: AppColors.textPinkcolor,
                  dotColor: AppColors.textWhitecolor),
            ),
            SizedBox(height: 30),
            GestureDetector(
              onTap: () {
                Get.to(Intro3());
              },
              child: Container(
                height: 50,
                width: Get.width * 0.7,
                decoration: BoxDecoration(
                    color: AppColors.textPinkcolor,
                    borderRadius: BorderRadius.circular(25)),
                child: Center(
                    child: CommonWidget().robotoText(
                        text: "Keep Going",
                        textColor: AppColors.textWhitecolor,
                        textWeight: FontWeight.w500,
                        textSize: 15.0)),
              ),
            ),
            SizedBox(height: 40),
          ],
        ),
      ),
    );
  }
}
