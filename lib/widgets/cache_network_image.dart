// import 'package:cached_network_image/cached_network_image.dart';
// import 'package:flutter/material.dart';

// class CacheNetworkImage extends StatelessWidget {
//   final String imageUrl;
//   const CacheNetworkImage({super.key, required this.imageUrl});

//   @override
//   Widget build(BuildContext context) {
//     return CachedNetworkImage(
//       imageUrl: imageUrl,
//       fit: BoxFit.contain,
//       width: double.infinity,
//       height: double.infinity,
//       // placeholder: (context, url) => SizedBox(
//       //   width: double.infinity,
//       //   height: double.infinity,
//       //   child: const Center(child: CircularProgressIndicator()),
//       // ),
//       errorWidget: (context, url, error) => const Icon(Icons.error),
//       fadeInDuration: const Duration(milliseconds: 500),
//       fadeOutDuration: const Duration(milliseconds: 500),
//       progressIndicatorBuilder: (context, url, downloadProgress) => Center(
//         child: CircularProgressIndicator(value: downloadProgress.progress),
//       ),
//       // onImageLoadError: (exception, stackTrace, url) {
//       //   setState(() {
//       //     _isLoading = false;
//       //   });
//       // },
//       imageBuilder: (context, imageProvider) {
//         return Container(
//           decoration: BoxDecoration(
//             borderRadius: BorderRadius.circular(15),
//             image: DecorationImage(
//               image: imageProvider,
//               fit: BoxFit.contain,
//             ),
//           ),
//         );
//       },
//     );
//   }
// }
