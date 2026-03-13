import 'package:flutter/material.dart';

import '../main.dart';

class GuideArabic extends StatefulWidget {
  const GuideArabic({super.key});

  @override
  State<GuideArabic> createState() => _GuideArabicState();
}

class _GuideArabicState extends State<GuideArabic> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  static const List<_GuideArabicStepData> _steps = [
    _GuideArabicStepData(
      icon: Icons.gesture,
      title: 'ترجمة القفاز الذكي',
      description:
          'ارتدِ القفاز الذكي ونفذ إشارات لغة الإشارة. تلتقط حساسات القفاز حركة الأصابع وتحوّلها مباشرة إلى صوت ونص.',
      accent: Color(0xFF0F4C81),
      backgroundStart: Color(0xFFE0F2FE),
      backgroundEnd: Color(0xFFF8FCFF),
    ),
    _GuideArabicStepData(
      icon: Icons.chat_bubble_outline,
      title: 'تواصل ثنائي الاتجاه',
      description:
          'يساعد الصوت المترجم على التواصل الفوري مع الآخرين. يمكن للطرف الآخر الرد بشكل طبيعي بينما يتواصل مستخدم القفاز عبر الإشارات.',
      accent: Color(0xFF8E24AA),
      backgroundStart: Color(0xFFF7E8FF),
      backgroundEnd: Color(0xFFFFFBFF),
    ),
    _GuideArabicStepData(
      icon: Icons.battery_full,
      title: 'مراقبة القفاز الذكي',
      description:
          'يعرض التطبيق حالة اتصال القفاز ومستوى البطارية والحالة العامة للنظام.',
      accent: Color(0xFF2E7D32),
      backgroundStart: Color(0xFFE7F8EA),
      backgroundEnd: Color(0xFFF9FFF9),
    ),
    _GuideArabicStepData(
      icon: Icons.camera_alt_outlined,
      title: 'الترجمة بالكاميرا',
      description:
          'إذا لم يكن القفاز الذكي متاحًا، يمكن للتطبيق استخدام كاميرا الهاتف لاكتشاف الإشارات وترجمتها إلى صوت أو نص.',
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

    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
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
                      if (!_isLastPage)
                        TextButton(
                          onPressed: _skipGuide,
                          child: const Text(
                            'تخطي',
                            style: TextStyle(
                              color: Color(0xFF1976D2),
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                      const Spacer(),
                      Text(
                        'دليل ناطق',
                        style: theme.textTheme.titleLarge?.copyWith(
                          color: const Color(0xFF0D47A1),
                          fontWeight: FontWeight.w800,
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
                    'كيفية استخدام ناطق',
                    style: theme.textTheme.headlineSmall?.copyWith(
                      color: const Color(0xFF0D47A1),
                      fontWeight: FontWeight.w800,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'تعرّف على طريقة عمل ناطق في وضع القفاز الذكي ووضع الكاميرا.',
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
                          child: _GuideArabicSlide(step: step),
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
                        _isLastPage ? 'ابدأ استخدام التطبيق' : 'التالي',
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
      ),
    );
  }
}

class _GuideArabicSlide extends StatelessWidget {
  const _GuideArabicSlide({required this.step});

  final _GuideArabicStepData step;

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

class _GuideArabicStepData {
  const _GuideArabicStepData({
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
