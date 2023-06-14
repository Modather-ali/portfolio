import 'package:flutter/material.dart';
import 'package:portfolio/widgets/widgets.dart';

import '../models/models.dart';

class ProjectContainer extends StatelessWidget {
  final void Function()? onTap;
  final Project project;
  const ProjectContainer({super.key, this.onTap, required this.project});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 15),
      child: InkWell(
        onTap: onTap,
        child: Card(
          child: Column(
            children: [
              AspectRatio(
                aspectRatio: 16 / 9,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: CacheNetworkImage(
                    imageUrl: project.images[project.coverImage],
                    radius: 15,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(5.0),
                child: Text(
                  project.name,
                  style: Theme.of(context).textTheme.titleMedium,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
