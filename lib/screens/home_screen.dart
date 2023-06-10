import 'package:flutter/material.dart';

import '../widgets/widgets.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Modather's Portfolio"),
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
          ListView.builder(
            itemCount: 10,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              return const ProjectContainer();
            },
          )
        ],
      ),
    );
  }
}
