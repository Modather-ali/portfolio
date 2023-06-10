import 'package:flutter/material.dart';

class ProjectContainer extends StatelessWidget {
  const ProjectContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 15),
      child: Card(
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.all(5),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                image: const DecorationImage(
                  image: AssetImage('assets/images/test_img.jpg'),
                  fit: BoxFit.cover,
                ),
              ),
              height: 250,
              width: double.infinity,
            ),
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: Text(
                "Project Name",
                style: Theme.of(context).textTheme.titleMedium,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
