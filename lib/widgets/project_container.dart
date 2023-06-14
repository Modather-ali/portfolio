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
                  child: CacheNetworkImage(
                      imageUrl: project.images[project.coverImage])
                  // Container(
                  //   margin: const EdgeInsets.all(5),
                  //   decoration: BoxDecoration(
                  //     borderRadius: BorderRadius.circular(15),
                  //     image: DecorationImage(
                  //       image: NetworkImage(project.images[0]),
                  //       fit: BoxFit.cover,
                  //     ),
                  //   ),
                  //   // height: 250,
                  //   // width: double.infinity,
                  // ),
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
