import 'dart:io';

import 'package:flutter/material.dart';

class ImagePickerButton extends StatelessWidget {
  final String? image;
  final void Function()? onTap;
  const ImagePickerButton({super.key, this.image, this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        alignment: Alignment.center,
        margin: const EdgeInsets.only(bottom: 10, left: 10),
        height: 250,
        width: 250,
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.circular(15),
          image: image == null
              ? null
              : image!.startsWith('http')
                  ? DecorationImage(
                      image: NetworkImage(
                        image!,
                      ),
                      fit: BoxFit.contain,
                    )
                  : DecorationImage(
                      image: FileImage(
                        File(image!),
                      ),
                      fit: BoxFit.contain,
                    ),
        ),
        child: image == null ? const Icon(Icons.add_a_photo) : null,
      ),
    );
  }
}
