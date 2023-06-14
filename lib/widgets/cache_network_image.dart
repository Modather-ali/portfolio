import 'package:flutter/material.dart';

import '../shared/packages.dart';

class CacheNetworkImage extends StatelessWidget {
  final String imageUrl;
  final double radius;
  const CacheNetworkImage({
    super.key,
    required this.imageUrl,
    this.radius = 0,
  });

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: imageUrl,
      fit: BoxFit.contain,
      width: double.infinity,
      height: double.infinity,
      // placeholder: (context, url) => SizedBox(
      //   width: double.infinity,
      //   height: double.infinity,
      //   child: const Center(child: CircularProgressIndicator()),
      // ),
      errorWidget: (context, url, error) => const Icon(Icons.error),
      fadeInDuration: const Duration(milliseconds: 500),
      fadeOutDuration: const Duration(milliseconds: 500),
      progressIndicatorBuilder: (context, url, downloadProgress) => Center(
        child: CircularProgressIndicator(value: downloadProgress.progress),
      ),
      // onImageLoadError: (exception, stackTrace, url) {
      //   setState(() {
      //     _isLoading = false;
      //   });
      // },
      imageBuilder: (context, imageProvider) {
        return Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(radius),
            image: DecorationImage(
              image: imageProvider,
              fit: BoxFit.cover,
            ),
          ),
        );
      },
    );
  }
}
