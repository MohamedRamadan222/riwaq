import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:riwaq/core/constants/app_colors.dart';
import 'package:riwaq/core/utils/widgets/custom_elevated_button.dart';

import '../../../auth/presentation/pages/login_screen.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  final PageController _controller = PageController();
  int _currentIndex = 0;

  final List<Map<String, String>> _pages = [
    {
      "image": "assets/images/book1.jpg",
      "text": "اكتشف آلاف الكتب في مكان واحد",
    },
    {"image": "assets/images/book2.jpg", "text": "اقرأ في أي وقت ومن أي مكان"},
    {"image": "assets/images/book3.jpg", "text": "احفظ كتبك المفضلة بسهولة"},
  ];

  bool get _isLastPage => _currentIndex == _pages.length - 1;

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            Align(
              alignment: Alignment.topLeft,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: TextButton(
                  onPressed: _isLastPage
                      ? null
                      : () => _controller.jumpToPage(_pages.length - 1),
                  child: Text(
                    _isLastPage ? '' : 'تخطي',
                    style: TextStyle(color: Colors.grey[600], fontSize: 16),
                  ),
                ),
              ),
            ),
            Expanded(
              child: PageView.builder(
                controller: _controller,
                itemCount: _pages.length,
                onPageChanged: (index) => setState(() => _currentIndex = index),
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 32),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          width: 250,
                          height: 250,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(24),
                            image: DecorationImage(
                              image: AssetImage(_pages[index]["image"]!),
                              fit: BoxFit.cover,
                            ),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withValues(alpha: 0.1),
                                blurRadius: 20,
                                offset: const Offset(0, 10),
                              ),
                            ],
                          ),
                        ),
                        const Gap(40),
                        Text(
                          _pages[index]["text"]!,
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                            height: 1.4,
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                _pages.length,
                (index) => AnimatedContainer(
                  duration: const Duration(milliseconds: 400),
                  margin: const EdgeInsets.symmetric(horizontal: 4),
                  height: 8,
                  width: _currentIndex == index ? 24 : 8,
                  decoration: BoxDecoration(
                    color: _currentIndex == index
                        ? AppColors.primary
                        : Colors.grey[300],
                    borderRadius: BorderRadius.circular(4),
                  ),
                ),
              ),
            ),
            const Gap(24),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
              child: SizedBox(
                width: double.infinity,
                height: 52,
                child: CustomElevatedButton(
                  title: _isLastPage ? 'ابدأ الآن' : 'التالي',
                  onPressed: () {
                    if (_isLastPage) {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (_) => LoginScreen()),
                      );
                    } else {
                      _controller.nextPage(
                        duration: const Duration(milliseconds: 350),
                        curve: Curves.easeInOut,
                      );
                    }
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
