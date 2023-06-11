import 'package:flutter/material.dart';

class DrawerItem extends StatelessWidget {
  final String title;
  final IconData iconData;
  final void Function()? onTap;
  const DrawerItem(
      {super.key, required this.title, required this.iconData, this.onTap});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        child: ListTile(
          onTap: onTap,
          leading: Icon(iconData),
          minLeadingWidth: 5,
          title: Text(title),
        ),
      ),
    );
  }
}
