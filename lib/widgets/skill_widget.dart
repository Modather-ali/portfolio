import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SkillWidget extends StatelessWidget {
  final String title;
  final double value;
  const SkillWidget({
    super.key,
    required this.title,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title, style: Theme.of(context).textTheme.titleMedium),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: CupertinoSlider(
                min: 0,
                max: 100,
                value: value,
                onChanged: (value) {},
              ),
            ),
            Text(
              "$value%",
              style: Theme.of(context).textTheme.labelLarge!.copyWith(
                    color: Colors.blue,
                  ),
            ),
          ],
        ),
      ],
    );
  }
}
