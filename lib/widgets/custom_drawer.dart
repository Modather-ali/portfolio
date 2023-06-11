import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../screens/screens.dart';
import 'widgets.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 50),
      child: Drawer(
        child: Column(
          children: [
            DrawerItem(
              title: "My Portfolio",
              iconData: FontAwesomeIcons.images,
              onTap: () {
                _navigateTo(context, const HomeScreen());
              },
            ),
            DrawerItem(
              title: "About Me",
              iconData: Icons.info_outline,
              onTap: () {
                _navigateTo(context, const AboutMeScreen());
              },
            ),
            const Spacer(),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: ContactMeBuilder(),
            ),
          ],
        ),
      ),
    );
  }

  void _navigateTo(BuildContext context, Widget widget) {
    Navigator.pop(context);
    Navigator.of(context)
        .pushReplacement(CupertinoPageRoute(builder: (context) => widget));
  }
}
