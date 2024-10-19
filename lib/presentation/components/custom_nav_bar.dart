import 'package:flutter/material.dart';
import 'package:gammal_tech_final_exam/presentation/screens/home_screen.dart';
import 'package:gammal_tech_final_exam/presentation/screens/leaderboard_screen.dart';
import 'package:gammal_tech_final_exam/presentation/screens/pricing_screen.dart';
import 'package:gammal_tech_final_exam/presentation/screens/user_history_screen.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';

class CustomNavBar extends StatelessWidget {
  CustomNavBar({super.key});
  final PersistentTabController _controller = PersistentTabController(initialIndex: 0);
  @override
  Widget build(BuildContext context) {
    return PersistentTabView(
      context,
      controller: _controller,
      screens: const [
        HomeScreen(),
        LeaderboardScreen(),
        PricingScreen(),
        UserHistoryScreen()
      ],
      items: _navBarsItems(),
      handleAndroidBackButtonPress: true,
      resizeToAvoidBottomInset: true,
      stateManagement: true,
      hideNavigationBarWhenKeyboardAppears: true,
      padding: const EdgeInsets.symmetric(vertical: 6),
      backgroundColor: Colors.white,
      isVisible: true,
      animationSettings: const NavBarAnimationSettings(
        navBarItemAnimation: ItemAnimationSettings(
          duration: Duration(milliseconds: 120),
          curve: Curves.ease,
        ),
        screenTransitionAnimation: ScreenTransitionAnimationSettings(
          animateTabTransition: true,
          duration: Duration(milliseconds: 120),
          screenTransitionAnimationType: ScreenTransitionAnimationType.fadeIn,
        ),
      ),
      confineToSafeArea: true,
      navBarHeight: kBottomNavigationBarHeight,
      navBarStyle: NavBarStyle.style6,
    );
  }
}

List<PersistentBottomNavBarItem> _navBarsItems() {
  return [
    PersistentBottomNavBarItem(
      icon: const Icon(Icons.home),
      title: ("Home"),
      activeColorPrimary: const Color(0xffFF904D),
      inactiveColorPrimary: const Color(0xff094546),
      
    ),
    PersistentBottomNavBarItem(
      icon: const Icon(Icons.leaderboard),
      title: ("Rank"),
      activeColorPrimary: const Color(0xffFF904D),
      inactiveColorPrimary: const Color(0xff094546),
    ),
    PersistentBottomNavBarItem(
      icon: const Icon(Icons.monetization_on),
      title: ("Pricing"),
      activeColorPrimary: const Color(0xffFF904D),
      inactiveColorPrimary: const Color(0xff094546),
    ),
    PersistentBottomNavBarItem(
      icon: const Icon(Icons.history),
      title: ("History"),
      activeColorPrimary: const Color(0xffFF904D),
      inactiveColorPrimary: const Color(0xff094546),
    ),
  ];
}
