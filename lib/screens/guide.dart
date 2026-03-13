import 'package:flutter/material.dart';

import '../main.dart';

class Guide extends StatefulWidget {
  const Guide({super.key});

  @override
  State<Guide> createState() => _GuideState();
}

class _GuideState extends State<Guide> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  static const List<_GuideStepData> _steps = [
    _GuideStepData(
      icon: Icons.gesture,
      title: 'Smart Glove Translation',
      description:
          'Wear the Smart Glove and perform sign language gestures. The glove sensors capture finger movements and translate them directly into voice and text output.',
      accent: Color(0xFF0F4C81),
      backgroundStart: Color(0xFFE0F2FE),
      backgroundEnd: Color(0xFFF8FCFF),
    ),
    _GuideStepData(
      icon: Icons.chat_bubble_outline,
      title: 'Two-Way Communication',
      description:
          'The translated speech allows communication with others instantly. The listener can respond normally while the glove user communicates through gestures.',
      accent: Color(0xFF8E24AA),
      backgroundStart: Color(0xFFF7E8FF),
      backgroundEnd: Color(0xFFFFFBFF),
    ),
    _GuideStepData(
      icon: Icons.battery_full,
      title: 'Monitor the Smart Glove',
      description:
          'The app displays the glove connection status, battery level, and overall system health.',
      accent: Color(0xFF2E7D32),
      backgroundStart: Color(0xFFE7F8EA),
      backgroundEnd: Color(0xFFF9FFF9),
    ),
    _GuideStepData(
      icon: Icons.camera_alt_outlined,
      title: 'Camera-Based Translation',
      description:
          'If the Smart Glove is not available, the app can use the device camera to detect hand gestures and translate them into speech or text.',
      accent: Color(0xFFE65100),
      backgroundStart: Color(0xFFFFEBD9),
      backgroundEnd: Color(0xFFFFFCF7),
    ),
  ];

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  bool get _isLastPage => _currentPage == _steps.length - 1;

  void _goToNextPage() {
    if (_isLastPage) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => const MainNavigation(),
        ),
      );
      return;
    }

    _pageController.nextPage(
      duration: const Duration(milliseconds: 350),
      curve: Curves.easeInOut,
    );
  }

  void _skipGuide() {
    _pageController.animateToPage(
      _steps.length - 1,
      duration: const Duration(milliseconds: 400),
      curve: Curves.easeInOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(0xFFE3F2FD),
              Colors.white,
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 18),
            child: Column(
              children: [
                Row(
                  children: [
                    Text(
                      'ناطق Guide',
                      style: theme.textTheme.titleLarge?.copyWith(
                        color: const Color(0xFF0D47A1),
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                    const Spacer(),
                    if (!_isLastPage)
                      TextButton(
                        onPressed: _skipGuide,
                        child: const Text(
                          'Skip',
                          style: TextStyle(
                            color: Color(0xFF1976D2),
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                  ],
                ),
                const SizedBox(height: 8),
                Container(
                  height: 88,
                  width: 88,
                  decoration: BoxDecoration(
                    color: const Color(0xFF0D47A1),
                    borderRadius: BorderRadius.circular(24),
                    boxShadow: [
                      BoxShadow(
                        color: const Color(0xFF1565C0).withValues(alpha: 0.22),
                        blurRadius: 24,
                        offset: const Offset(0, 12),
                      ),
                    ],
                  ),
                  child: const Icon(
                    Icons.gesture,
                    color: Colors.white,
                    size: 50,
                  ),
                ),
                const SizedBox(height: 18),
                Text(
                  'How to Use Natiq',
                  style: theme.textTheme.headlineSmall?.copyWith(
                    color: const Color(0xFF0D47A1),
                    fontWeight: FontWeight.w800,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 8),
                Text(
                  'Learn how Natiq works in Smart Glove mode and Camera mode.',
                  style: theme.textTheme.bodyMedium?.copyWith(
                    color: const Color(0xFF5C6F92),
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 28),
                Expanded(
                  child: PageView.builder(
                    controller: _pageController,
                    physics: const BouncingScrollPhysics(),
                    onPageChanged: (index) {
                      setState(() {
                        _currentPage = index;
                      });
                    },
                    itemCount: _steps.length,
                    itemBuilder: (context, index) {
                      final step = _steps[index];
                      return AnimatedPadding(
                        duration: const Duration(milliseconds: 250),
                        curve: Curves.easeOut,
                        padding: EdgeInsets.only(
                          top: index == _currentPage ? 0 : 14,
                          bottom: index == _currentPage ? 8 : 20,
                        ),
                        child: _GuideSlide(step: step),
                      );
                    },
                  ),
                ),
                const SizedBox(height: 18),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(
                    _steps.length,
                    (index) => AnimatedContainer(
                      duration: const Duration(milliseconds: 250),
                      margin: const EdgeInsets.symmetric(horizontal: 4),
                      height: 10,
                      width: index == _currentPage ? 28 : 10,
                      decoration: BoxDecoration(
                        color: index == _currentPage
                            ? const Color(0xFF1976D2)
                            : const Color(0xFFB9D3F5),
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 18),
                SizedBox(
                  width: double.infinity,
                  height: 56,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF1976D2),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(24),
                      ),
                      elevation: 0,
                    ),
                    onPressed: _goToNextPage,
                    child: Text(
                      _isLastPage ? 'Start Using App' : 'Next',
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _GuideSlide extends StatelessWidget {
  const _GuideSlide({required this.step});

  final _GuideStepData step;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 2),
      padding: const EdgeInsets.fromLTRB(24, 28, 24, 26),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            step.backgroundStart,
            step.backgroundEnd,
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(28),
        boxShadow: [
          BoxShadow(
            color: const Color(0x1A1F2A44).withValues(alpha: 0.12),
            blurRadius: 24,
            offset: const Offset(0, 16),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Spacer(),
          Container(
            width: 110,
            height: 110,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              gradient: LinearGradient(
                colors: [
                  step.accent.withValues(alpha: 0.16),
                  step.accent.withValues(alpha: 0.32),
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
            child: Icon(
              step.icon,
              size: 54,
              color: step.accent,
            ),
          ),
          const SizedBox(height: 28),
          Text(
            step.title,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w800,
              color: Color(0xFF0D47A1),
            ),
          ),
          const SizedBox(height: 14),
          Text(
            step.description,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 15,
              height: 1.6,
              color: Color(0xFF5A6787),
            ),
          ),
          const Spacer(),
        ],
      ),
    );
  }
}

class _GuideStepData {
  const _GuideStepData({
    required this.icon,
    required this.title,
    required this.description,
    required this.accent,
    required this.backgroundStart,
    required this.backgroundEnd,
  });

  final IconData icon;
  final String title;
  final String description;
  final Color accent;
  final Color backgroundStart;
  final Color backgroundEnd;
}
