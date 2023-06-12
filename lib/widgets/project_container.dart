import 'package:flutter/material.dart';

class ProjectContainer extends StatelessWidget {
  final void Function()? onTap;
  const ProjectContainer({super.key, this.onTap});

  @override
  Widget build(BuildContext context) {
    //details
    return Padding(
      padding: const EdgeInsets.only(top: 15),
      child: InkWell(
        onTap: onTap,
        child: Card(
          child: Column(
            children: [
              AspectRatio(
                aspectRatio: 16 / 9,
                child: Container(
                  margin: const EdgeInsets.all(5),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    image: const DecorationImage(
                      image: AssetImage('assets/images/test_img.jpg'),
                      fit: BoxFit.cover,
                    ),
                  ),
                  // height: 250,
                  // width: double.infinity,
                ),
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
      ),
    );
  }
}
