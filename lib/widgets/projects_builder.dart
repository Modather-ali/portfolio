import 'package:flutter/cupertino.dart';
import 'package:portfolio/shared/packages.dart';

import '../models/models.dart';
import '../providers/providers.dart';
import '../screens/screens.dart';
import 'project_container.dart';

class ProjectsBuilder extends StatelessWidget {
  const ProjectsBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    List<Project> projects = context.read<ProjectProvider>().projects;
    return ListView.builder(
      itemCount: projects.length,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) {
        return ProjectContainer(
          project: projects[index],
          onTap: () {
            Navigator.of(context).push(CupertinoPageRoute(
                builder: (context) => const ProjectDetailsScreen()));
          },
        );
      },
    );
  }
}
