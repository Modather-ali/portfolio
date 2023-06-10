import 'package:flutter/material.dart';

class DynamicAppBar extends StatelessWidget with PreferredSizeWidget {
  final String title;
  const DynamicAppBar({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(title),
      actions: [
        IconButton(
          onPressed: () {},
          icon: const Icon(Icons.menu),
        )
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(50);
}
