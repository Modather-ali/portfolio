import 'package:flutter/cupertino.dart';

import '../screens/screens.dart';
import 'project_container.dart';

class ProjectsBuilder extends StatelessWidget {
  const ProjectsBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 3,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) {
        return ProjectContainer(
          onTap: () {
            Navigator.of(context).push(CupertinoPageRoute(
                builder: (context) => const ProjectDetailsScreen()));
          },
        );
      },
    );
  }
}
