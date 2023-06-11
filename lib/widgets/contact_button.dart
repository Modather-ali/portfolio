import 'package:flutter/material.dart';

class ContactButton extends StatelessWidget {
  final void Function()? onPressed;
  final IconData? icon;
  final Color? color;
  const ContactButton({
    super.key,
    required this.onPressed,
    required this.icon,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
      child: IconButton(
        onPressed: onPressed,
        icon: Icon(
          icon,
          color: color,
        ),
      ),
    );
  }
}
