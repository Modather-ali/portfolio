import 'dart:io';

// import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class ImageContainer extends StatelessWidget {
  final String image;
  final void Function()? onDelete;
  final bool isCoverImage;
  final void Function()? onSelectImage;
  const ImageContainer({
    super.key,
    required this.image,
    this.onDelete,
    required this.isCoverImage,
    this.onSelectImage,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: onSelectImage,
          child: Row(
            children: [
              const Text('Set as Cover Image'),
              Checkbox(
                value: isCoverImage,
                onChanged: (_) {},
              ),
            ],
          ),
        ),
        Container(
          alignment: Alignment.center,
          margin: const EdgeInsets.only(bottom: 10, left: 10),
          height: 250,
          width: 250,
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey),
            borderRadius: BorderRadius.circular(15),
            image: image.startsWith('http')
                ? null
                : DecorationImage(
                    image: FileImage(
                      File(image),
                    ),
                    fit: BoxFit.cover,
                  ),
          ),
          child: SizedBox(
            width: double.infinity,
            height: double.infinity,
            child: Stack(
              alignment: Alignment.center,
              children: [
                if (image.startsWith('http'))
                  const Padding(
                    padding: EdgeInsets.all(8.0),
                    // child: CachedNetworkImage(imageUrl: image),
                  ),
                Positioned(
                  top: 0,
                  right: 0,
                  child: IconButton(
                    onPressed: onDelete,
                    icon: const Icon(Icons.delete),
                    color: Colors.red,
                    iconSize: 30,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
