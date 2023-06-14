import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'widgets.dart';

class ProjectImagesBuilder extends StatefulWidget {
  final List<String> images;
  const ProjectImagesBuilder({super.key, required this.images});

  @override
  State<ProjectImagesBuilder> createState() => _ProjectImagesBuilderState();
}

class _ProjectImagesBuilderState extends State<ProjectImagesBuilder> {
  final PageController _pageController = PageController();

  int _imageIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AspectRatio(
          aspectRatio: 16 / 9,
          child: PageView.builder(
            scrollDirection: Axis.horizontal,
            controller: _pageController,
            onPageChanged: (index) {
              setState(() => _imageIndex = index);
            },
            itemCount: widget.images.length,
            itemBuilder: (context, index) {
              return InkWell(
                onTap: () {
                  Navigator.of(context).push(CupertinoPageRoute(
                    builder: (context) => ImageViewer(
                      currentImageIndex: _imageIndex,
                      images: widget.images,
                    ),
                  ));
                },
                child: AspectRatio(
                  aspectRatio: 16 / 9,
                  child: CacheNetworkImage(imageUrl: widget.images[index]),
                ),
              );
            },
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8),
          child: AnimatedDots(
            currentIndex: _imageIndex,
            itemCount: widget.images.length,
          ),
        ),
      ],
    );
  }
}
