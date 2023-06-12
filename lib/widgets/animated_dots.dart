import 'package:flutter/material.dart';

class AnimatedDots extends StatefulWidget {
  const AnimatedDots(
      {super.key, required this.currentIndex, required this.itemCount});
  final int currentIndex;
  final int itemCount;
  @override
  AnimatedDotsState createState() => AnimatedDotsState();
}

class AnimatedDotsState extends State<AnimatedDots>
    with SingleTickerProviderStateMixin {
  AnimationController? _animationController;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 2000))
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          _animationController!.reset();
          _animationController!.forward();
        }
      });
    _animationController!.forward();
  }

  @override
  void dispose() {
    _animationController!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animationController!,
      builder: (context, child) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(
            widget.itemCount,
            (index) {
              return Opacity(
                opacity: index == widget.currentIndex ? 1.0 : 0.2,
                child: Container(
                  margin: const EdgeInsets.only(left: 10),
                  decoration: const BoxDecoration(
                    color: Colors.black,
                    shape: BoxShape.circle,
                  ),
                  height: 10,
                  width: 10,
                ),
              );
            },
          ),
        );
      },
    );
  }
}
