import 'dart:async';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class GlobalLoadingDotWidget extends StatefulWidget {
  final Size size;
  const GlobalLoadingDotWidget({super.key, required this.size});

  @override
  State<GlobalLoadingDotWidget> createState() => _GlobalLoadingDotWidgetState();
}

class _GlobalLoadingDotWidgetState extends State<GlobalLoadingDotWidget> {
  late PageController _controller;
  Timer? _timer;

  final int _totalDots = 5;
  int _currentDot = 0;

  @override
  void initState() {
    super.initState();

    _controller = PageController(viewportFraction: 0.8, keepPage: true);
    _timer = Timer.periodic(const Duration(milliseconds: 400), (_) {
      _currentDot = (_currentDot + 1) % _totalDots;
      _controller.animateToPage(
        _currentDot,
        duration: const Duration(milliseconds: 400),
        curve: Curves.easeInOut,
      );
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widget.size.width,
      height: widget.size.height,
      child: Stack(
        alignment: Alignment.center,
        children: [
          SmoothPageIndicator(
            controller: _controller,
            count: _totalDots,
            effect: WormEffect(
              dotHeight: 16,
              dotWidth: 16,
              activeDotColor: Theme.of(context).primaryColor,
              dotColor: Theme.of(context).disabledColor,
            ),
          ),
          // 반드시 존재해야 함: 페이지 컨트롤러 연동용
          Positioned(
            bottom: -100, // 화면 밖으로 숨김
            child: SizedBox(
              height: 1,
              width: 1,
              child: PageView.builder(
                controller: _controller,
                itemCount: _totalDots,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (_, __) => const SizedBox(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
