import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:riwaq/features/profile/presentation/pages/profile_screen.dart';

import '../../../../core/constants/app_colors.dart';
import 'home_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int currentIndex = 4;
  static const List<Widget> screens = [
    ProfileScreen(),
    Scaffold(backgroundColor: Colors.white60),
    Scaffold(backgroundColor: Colors.blue),
    Scaffold(backgroundColor: Colors.green),
    HomeScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(index: currentIndex, children: screens),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,

        onTap: (index) {
          setState(() {
            currentIndex = index;
          });
        },
        selectedItemColor: AppColors.primary,
        unselectedItemColor: AppColors.textHint,
        backgroundColor: AppColors.white,
        showSelectedLabels: true,
        showUnselectedLabels: true,
        iconSize: 24,
        type: BottomNavigationBarType.fixed,
        selectedFontSize: 10,
        unselectedFontSize: 10,
        elevation: 8,
        selectedLabelStyle: const TextStyle(
          fontSize: 10,
          fontWeight: FontWeight.w500,
        ),
        unselectedLabelStyle: const TextStyle(
          fontSize: 10,
          fontWeight: FontWeight.w400,
        ),
        items: const [
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.person),
            activeIcon: Icon(CupertinoIcons.person_fill),
            label: "الحساب",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.messenger_outline_rounded),
            activeIcon: Icon(Icons.messenger_outlined),
            label: "الرسائل",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add),
            activeIcon: Icon(Icons.add_outlined),
            label: "اضافة",
          ),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.heart),
            activeIcon: Icon(CupertinoIcons.heart_fill),
            label: "التصنيفات",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            activeIcon: Icon(Icons.home),
            label: "الرئيسية",
          ),
        ],
      ),
    );
  }
}
