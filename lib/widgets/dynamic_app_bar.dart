import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'widgets.dart';

class DynamicAppBar extends StatelessWidget {
  final String title;
  final Widget body;
  const DynamicAppBar({super.key, required this.title, required this.body});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(title),
        ),
        body: body,
        drawer: const CustomDrawer());
  }
}
