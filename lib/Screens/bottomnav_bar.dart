// ignore_for_file: prefer_interpolation_to_compose_strings, prefer_const_constructors_in_immutables

import "package:flutter/material.dart";
import "package:flutter/services.dart";
import "package:persistent_bottom_nav_bar_v2/persistent_bottom_nav_bar_v2.dart";
import "package:video_app/Screens/home_view.dart";
import "package:video_app/Screens/profile_view.dart";
import "package:video_app/Screens/trending_view.dart";

import "../Utilities/colors.dart";

class BottomNavBar extends StatelessWidget {
  BottomNavBar({super.key});

  List<PersistentTabConfig> _tabs() => [
        PersistentTabConfig(
          screen: HomeView(),
          item: ItemConfig(
            activeForegroundColor: Colors.white,
            icon: Icon(Icons.home),
            inactiveIcon: Icon(Icons.home_outlined),
            title: "Home",
          ),
        ),
        PersistentTabConfig(
          screen: TrendingView(),
          item: ItemConfig(
            activeForegroundColor: Colors.white,
            inactiveIcon: Icon(Icons.rocket_launch_outlined),
            icon: Icon(Icons.rocket_launch_rounded),
            title: "Treding",
          ),
        ),
        PersistentTabConfig(
          screen: ProfileView(),
          item: ItemConfig(
            activeForegroundColor: Colors.white,
            icon: Icon(Icons.person),
            inactiveIcon: Icon(Icons.person_outlined),
            title: "Profile",
          ),
        ),
      ];

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark);
    return PersistentTabView(
      tabs: _tabs(),
      navBarBuilder: (navBarConfig) => Style8BottomNavBar(
        navBarConfig: navBarConfig,
        navBarDecoration: NavBarDecoration(color: AppColors.bgcolor),
      ),
      navBarOverlap: NavBarOverlap.full(),
    );
  }
}
