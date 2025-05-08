// ignore_for_file: prefer_interpolation_to_compose_strings, deprecated_member_use, file_names

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../../Controllers/app_add_controller.dart';
import '../../Utilities/colors.dart';
import '../../Utilities/common_widget.dart';
import '../../Utilities/images.dart';
import '../bottomnav_bar.dart';

class Intro9 extends StatefulWidget {
  const Intro9({super.key});

  @override
  State<Intro9> createState() => _Intro9State();
}

class _Intro9State extends State<Intro9> {
  AppAddController addController = Get.put(AppAddController());
  PageController pageController = PageController(initialPage: 8);

  NativeAd? _nativeAd;
  bool _nativeAdIsLoaded = false;

  void loadNativeAd() {
    _nativeAd = NativeAd(
        adUnitId: 'ca-app-pub-3940256099942544/2247696110',
        listener: NativeAdListener(
          onAdLoaded: (ad) {
            print('$NativeAd loaded.');
            setState(() {
              _nativeAdIsLoaded = true;
            });
          },
          onAdFailedToLoad: (ad, error) {
            print('$NativeAd failedToLoad: $error');
            ad.dispose();
          },
          onAdClicked: (ad) {},
          onAdImpression: (ad) {},
          onAdClosed: (ad) {},
          onAdOpened: (ad) {},
          onAdWillDismissScreen: (ad) {},
          onPaidEvent: (ad, valueMicros, precision, currencyCode) {},
        ),
        request: const AdRequest(),
        nativeTemplateStyle: NativeTemplateStyle(
          templateType: TemplateType.medium,
        ))
      ..load();
  }

  @override
  void initState() {
    loadNativeAd();
    super.initState();
  }

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
                      image: AssetImage(AppImage.images + "9.png"),
                      fit: BoxFit.contain)),
            ),
            SizedBox(height: 25),
            _nativeAdIsLoaded
                ? Container(
                    height: 170,
                    width: Get.width,
                    alignment: Alignment.center,
                    color: Colors.black12,
                    child: AdWidget(ad: _nativeAd!),
                  )
                : SizedBox(),
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
                addController.showInterstitialAd();
                Get.to(BottomNavBar());
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
