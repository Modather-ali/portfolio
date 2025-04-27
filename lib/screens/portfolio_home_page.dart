import 'package:flutter/material.dart';

import 'about_section.dart';
import 'contact_section.dart';
import 'skills_section.dart';

class PortfolioHomePage extends StatelessWidget {
  const PortfolioHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            AboutSection(),
            SkillsSection(),
            ContactSection(),
            const SizedBox(height: 10),
            Text('Made with Flutter 💙 by Modather Ali'),
          ],
        ),
      ),
    );
  }
}
