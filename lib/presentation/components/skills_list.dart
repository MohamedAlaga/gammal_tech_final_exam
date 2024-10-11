import 'package:flutter/material.dart';

class SkillsList extends StatelessWidget {
  const SkillsList({super.key, required this.skills});

  final List<String> skills;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Wrap(
          spacing: 6,
          children: skills
              .map(
                (skill) => Chip(
                  label: Text(skill),
                  backgroundColor: Color(0xff094546),
                  labelStyle: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontFamily: 'SourceSans3',
                    fontWeight: FontWeight.bold,
                  ),
                ),
              )
              .toList(),
        ),
      ],
    );
  }
}
