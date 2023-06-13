import 'package:flutter/material.dart';

import '../../widgets/widgets.dart';

class ProjectDetailsScreen extends StatefulWidget {
  const ProjectDetailsScreen({super.key});

  @override
  State<ProjectDetailsScreen> createState() => _ProjectDetailsScreenState();
}

class _ProjectDetailsScreenState extends State<ProjectDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Project Name"),
        centerTitle: true,
      ),
      body: Column(
        children: [
          const ProjectImagesBuilder(),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              'Long text, ' * 10,
              style: Theme.of(context).textTheme.labelLarge,
            ),
          ),
          // const Spacer(),
          Text(
            "Used Skills",
            style: Theme.of(context).textTheme.titleMedium!.copyWith(
                  color: Colors.blue,
                ),
          ),
          Wrap(
            children: [
              for (var i = 0; i < 5; i++)
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 5),
                  child: Chip(
                    label: Text('Flutter'),
                    // backgroundColor: Theme.of(context).primaryColor!,
                  ),
                ),
            ],
          ),
          // const Spacer(),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: Row(
              children: [
                const Spacer(),
                ElevatedButton.icon(
                  onPressed: () {},
                  icon: const Icon(Icons.android),
                  label: const Text('Try the app'),
                ),
                const Spacer(),
                ElevatedButton.icon(
                  onPressed: () {},
                  icon: const Icon(Icons.code),
                  label: const Text('View Source code'),
                ),
                const Spacer(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
