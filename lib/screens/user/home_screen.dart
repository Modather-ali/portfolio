import 'package:flutter/material.dart';

import '../../widgets/widgets.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DynamicAppBar(
      title: "Modather's Portfolio",
      body: ListView(
        padding: const EdgeInsets.fromLTRB(15, 10, 15, 0),
        children: [
          Text(
            "Hey, I'm Modather Ali",
            style: Theme.of(context).textTheme.titleLarge,
          ),
          const Text("An Applications Developer"),
          const SizedBox(width: double.infinity),
          const ProjectsBuilder(),
          const ContactMeBuilder(),
        ],
      ),
    );
  }
}
