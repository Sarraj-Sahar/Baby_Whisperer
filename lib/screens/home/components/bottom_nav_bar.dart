import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class MyBottomNavBar extends StatelessWidget {
  void Function(int)? onTabChange;
  MyBottomNavBar({super.key, required onTabChange});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 25.0),
      child: GNav(
        // selectedIndex: ,
        onTabChange: (value) => onTabChange!(value),
        // onTabChange: (value) =>
        //     onTabChange == null ? print("nulllll") : onTabChange!(value),
        mainAxisAlignment: MainAxisAlignment.center,
        tabBackgroundColor: Colors.white,
        gap: 8,
        tabActiveBorder: Border.all(color: Colors.grey),
        tabs: const [
          GButton(
            icon: Icons.home,
            text: "Home",
          ),
          GButton(
            icon: Icons.person,
            text: "Profile",
          ),
        ],
      ),
    );
  }
}
