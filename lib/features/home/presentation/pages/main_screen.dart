import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:riwaq/core/constants/app_colors.dart';
import 'package:riwaq/core/constants/app_styles.dart';
import 'package:riwaq/features/favorites/presentation/pages/favorites_screen.dart';
import 'package:riwaq/features/profile/presentation/pages/profile_screen.dart';

import 'home_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int currentIndex = 4;
  late final List<Widget> screens = [
    const ProfileScreen(),
    const _PlaceholderScreen(
      icon: CupertinoIcons.chat_bubble_2,
      title: 'الرسائل',
      message: 'سيتم تفعيل المحادثات قريبا',
    ),
    const _PlaceholderScreen(
      icon: CupertinoIcons.add,
      title: 'إضافة كتاب',
      message: 'سيتم تفعيل اضافة الكتب قريبا',
    ),
    const FavoritesScreen(),
    HomeScreen(
      onAddBookPressed: () => setState(() => currentIndex = 2),
    ),
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
            label: "المفضلة",
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

class _PlaceholderScreen extends StatelessWidget {
  final IconData icon;
  final String title;
  final String message;

  const _PlaceholderScreen({
    required this.icon,
    required this.title,
    required this.message,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        backgroundColor: Colors.grey[100],
        surfaceTintColor: Colors.transparent,
        elevation: 0,
        scrolledUnderElevation: 0,
        toolbarHeight: 50,
        title: Text(title),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              size: 60,
              color: AppColors.primary.withValues(alpha: 0.4),
            ),
            const Gap(16),
            Text(message, style: AppStyles.bold13),
          ],
        ),
      ),
    );
  }
}
