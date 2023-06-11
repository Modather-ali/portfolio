import 'package:flutter/material.dart';

import '../widgets/widgets.dart';

class AboutMeScreen extends StatelessWidget {
  const AboutMeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DynamicAppBar(
      title: 'About Me',
      body: ListView(
        padding: const EdgeInsets.symmetric(vertical: 25),
        children: [
          Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              const CircleAvatar(
                radius: 50,
                child: CircleAvatar(
                  foregroundImage: AssetImage('assets/images/me.png'),
                  radius: 47.5,
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Modather Ali',
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  Text(
                    'An Applications Developer',
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                ],
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(15),
            child: Text(
              " Hi!, I am Modather Ali, who has a strong passion and interest for design and developing Mobile Apps, I have +2 years of experience dealing with Flutter framework, And I'm passionate about helping people own their own apps.",
              style: Theme.of(context).textTheme.labelLarge,
              // textAlign: TextAlign.center,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Text(
              "My Skills",
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    color: Colors.blue,
                  ),
            ),
          ),
          const SkillWidget(title: 'Flutter', value: 95),
          const SkillWidget(title: 'Dart', value: 90),
          const SkillWidget(title: 'Firebase', value: 75),
          const SkillWidget(title: 'Git', value: 80),
          const SkillWidget(title: 'APIs', value: 90),
        ],
      ),
    );
  }
}
