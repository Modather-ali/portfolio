import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:portfolio/shared/packages.dart';

import '../../../widgets/widgets.dart';
import '../../models/models.dart';
import '../../providers/providers.dart';
import '../screens.dart';

class ProjectsScreen extends StatelessWidget {
  const ProjectsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    List<Project> projects = context.read<ProjectProvider>().projects;
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          Navigator.of(context).push(CupertinoPageRoute(
              builder: (context) => const AddProjectScreen()));
        },
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(10),
        itemCount: projects.length,
        shrinkWrap: true,
        itemBuilder: (context, index) {
          return ProjectContainer(
            project: projects[index],
            onTap: () {
              showDialog(
                context: context,
                builder: (context) {
                  return AlertDialog(
                    title: const Text('Delete this project'),
                    actions: [
                      TextButton(
                          onPressed: () async {
                            await context
                                .read<ProjectProvider>()
                                .deleteProject(projects[index]);
                            Navigator.pop(context);
                          },
                          child: const Text('Yes')),
                      TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: const Text('back'),
                      ),
                    ],
                  );
                },
              );
            },
          );
        },
      ),
    );
  }
}
