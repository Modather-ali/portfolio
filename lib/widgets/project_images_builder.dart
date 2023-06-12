import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'widgets.dart';

class ProjectImagesBuilder extends StatefulWidget {
  const ProjectImagesBuilder({super.key});

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
          child: PageView(
            scrollDirection: Axis.horizontal,
            controller: _pageController,
            onPageChanged: (index) {
              setState(() => _imageIndex = index);
            },
            children: List.generate(
              5,
              (index) => InkWell(
                onTap: () {
                  Navigator.of(context).push(CupertinoPageRoute(
                    builder: (context) =>
                        ImageViewer(currentImageIndex: _imageIndex),
                  ));
                },
                child: AspectRatio(
                  aspectRatio: 16 / 9,
                  child: Container(
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('assets/images/test_img.jpg'),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8),
          child: AnimatedDots(
            currentIndex: _imageIndex,
            itemCount: 5,
          ),
        ),
      ],
    );
  }
}
