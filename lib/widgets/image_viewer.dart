import 'dart:async';

import 'package:flutter/material.dart';

class ImageViewer extends StatefulWidget {
  final int currentImageIndex;
  const ImageViewer({
    super.key,
    this.currentImageIndex = 0,
  });

  @override
  State<ImageViewer> createState() => _ImageViewerState();
}

class _ImageViewerState extends State<ImageViewer> {
  final PageController _pageController = PageController();
  @override
  void initState() {
    Timer.periodic(const Duration(milliseconds: 1), (timer) {
      _pageController.jumpToPage(widget.currentImageIndex);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white12,
      body: PageView.builder(
        scrollDirection: Axis.horizontal,
        controller: _pageController,
        itemCount: 5,
        itemBuilder: (context, index) =>
            Center(child: Image.asset('assets/images/test_img.jpg')),
      ),
    );
  }
}
