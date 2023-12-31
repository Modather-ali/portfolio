import 'package:flutter/material.dart';

import '../../widgets/widgets.dart';

class ImageViewer extends StatefulWidget {
  final int currentImageIndex;
  final List<String> images;
  const ImageViewer({
    super.key,
    this.currentImageIndex = 0,
    required this.images,
  });

  @override
  State<ImageViewer> createState() => _ImageViewerState();
}

class _ImageViewerState extends State<ImageViewer> {
  final PageController _pageController = PageController();
  // @override
  // void initState() {
  //   Timer.periodic(const Duration(milliseconds: 1), (timer) {
  //     _pageController.animateToPage(
  //       widget.currentImageIndex,
  //       duration: const Duration(seconds: 1),
  //       curve: Curves.bounceIn,
  //     );
  //   });
  //   super.initState();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white12,
      body: PageView.builder(
        scrollDirection: Axis.horizontal,
        controller: _pageController,
        itemCount: widget.images.length,
        itemBuilder: (context, index) =>
            Center(child: CacheNetworkImage(imageUrl: widget.images[index])),
      ),
    );
  }
}
