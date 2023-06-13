import 'package:flutter/material.dart';

class ChoiceSkillChip extends StatelessWidget {
  final String skillName;
  final bool selected;
  final void Function(bool)? onSelected;
  const ChoiceSkillChip({
    super.key,
    required this.skillName,
    required this.selected,
    this.onSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5),
      child: ChoiceChip(
        label: Text(skillName),
        selected: selected,
        onSelected: onSelected,
      ),
    );
  }
}
