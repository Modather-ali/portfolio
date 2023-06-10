import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../widgets/widgets.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Modather's Portfolio"),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.menu),
          )
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.fromLTRB(15, 10, 15, 0),
        children: [
          Text(
            "Hey, I'm Modather Ali",
            style: Theme.of(context).textTheme.titleLarge,
          ),
          const Text("A Mobile Applications Developer"),
          const SizedBox(width: double.infinity),
          const ProjectsBuilder(),
          const SizedBox(height: 20),
          const Text("Contact Me"),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ContactButton(
                onPressed: () {},
                icon: FontAwesomeIcons.github,
              ),
              ContactButton(
                onPressed: () {},
                icon: Icons.email,
              ),
              ContactButton(
                onPressed: () {},
                icon: FontAwesomeIcons.whatsapp,
              ),
              ContactButton(
                onPressed: () {},
                icon: FontAwesomeIcons.linkedinIn,
              ),
              ContactButton(
                onPressed: () {},
                icon: FontAwesomeIcons.telegram,
              ),
            ],
          ),
          const SizedBox(height: 20)
        ],
      ),
    );
  }
}
