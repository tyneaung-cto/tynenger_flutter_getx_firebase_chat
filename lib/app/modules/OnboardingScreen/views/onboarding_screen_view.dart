import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:getwidget/getwidget.dart';

class OnboardingScreenView extends StatefulWidget {
  const OnboardingScreenView({super.key});

  @override
  State<OnboardingScreenView> createState() => _OnboardingScreenViewState();
}

class _OnboardingScreenViewState extends State<OnboardingScreenView> {
  late PageController _pageController;
  late List<Widget> slideList;
  late int initialPage;

  @override
  void initState() {
    super.initState();
    initialPage = 0;
    _pageController = PageController(initialPage: initialPage);
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    slideList = slides();
  }

  List<Widget> slides() {
    return [
      _buildSlide(
        title: 'Welcome to our App',
        subtitle: 'Experience seamless connectivity',
      ),
      _buildSlide(
        title: 'Connect with friends',
        subtitle: 'Stay in touch anytime, anywhere',
      ),
      _buildSlide(
        title: 'Get Started Now',
        subtitle: 'Join us and explore the possibilities',
      ),
    ];
  }

  Widget _buildSlide({required String title, required String subtitle}) {
    final theme = Theme.of(context);
    final backgroundColor = theme.colorScheme.background;
    final textColor = theme.textTheme.titleLarge?.color ?? Colors.black87;
    final subtitleColor =
        theme.textTheme.bodyMedium?.color?.withOpacity(0.7) ?? Colors.black54;

    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [backgroundColor, backgroundColor.withOpacity(0.95)],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 32),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(24),
            child: Image.asset(
              'assets/icon/icon.png',
              width: 180,
              height: 180,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(height: 48),
          Text(
            title,
            textAlign: TextAlign.center,
            style: theme.textTheme.headlineSmall?.copyWith(
              fontWeight: FontWeight.bold,
              color: textColor,
            ),
          ),
          const SizedBox(height: 16),
          Text(
            subtitle,
            textAlign: TextAlign.center,
            style: theme.textTheme.titleMedium?.copyWith(color: subtitleColor),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return SafeArea(
      child: GFIntroScreen(
        color: theme.colorScheme.background,
        slides: slideList,
        pageController: _pageController,
        currentIndex: initialPage,
        pageCount: slideList.length,
        introScreenBottomNavigationBar: GFIntroScreenBottomNavigationBar(
          pageController: _pageController,
          pageCount: slideList.length,
          currentIndex: initialPage,
          navigationBarColor: theme.scaffoldBackgroundColor,
          activeColor: Colors.blueAccent,
          inactiveColor: Colors.grey,
          showDivider: false,
          onSkipTap: () {
            Get.offNamed('/register-screen');
          },
          onDoneTap: () {
            Get.offNamed('/register-screen');
          },
          onForwardButtonTap: () {
            if (initialPage < slideList.length - 1) {
              setState(() {
                initialPage++;
              });
              _pageController.animateToPage(
                initialPage,
                duration: const Duration(milliseconds: 300),
                curve: Curves.ease,
              );
            } else {
              print('Onboarding complete. Navigate to Register Screen.');
              Get.offNamed('/register-screen');
            }
          },
          onBackButtonTap: () {
            if (initialPage > 0) {
              setState(() {
                initialPage--;
              });
              _pageController.animateToPage(
                initialPage,
                duration: const Duration(milliseconds: 300),
                curve: Curves.ease,
              );
            }
          },
        ),
      ),
    );
  }
}
