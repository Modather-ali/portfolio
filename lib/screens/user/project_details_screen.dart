import 'package:flutter/material.dart';

import '../../models/models.dart';
import '../../services/uri_luncher.dart';
import '../../widgets/widgets.dart';

class ProjectDetailsScreen extends StatelessWidget {
  final Project project;
  const ProjectDetailsScreen({
    super.key,
    required this.project,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(project.name),
        centerTitle: true,
      ),
      body: Column(
        children: [
          ProjectImagesBuilder(images: project.images),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              project.description,
              style: Theme.of(context).textTheme.labelLarge,
            ),
          ),
          Text(
            "Used Skills",
            style: Theme.of(context).textTheme.titleMedium!.copyWith(
                  color: Colors.blue,
                ),
          ),
          Wrap(
            children: [
              for (String skill in project.usedSkills)
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 5),
                  child: Chip(
                    label: Text(skill),
                  ),
                ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: Row(
              children: [
                const Spacer(),
                ElevatedButton.icon(
                  onPressed: () {
                    UrlLuncher.lunchUrl(project.appUrl);
                  },
                  icon: const Icon(Icons.android),
                  label: const Text('Try the app'),
                ),
                const Spacer(),
                ElevatedButton.icon(
                  onPressed: () {
                    UrlLuncher.lunchUrl(project.codeUrl);
                  },
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
