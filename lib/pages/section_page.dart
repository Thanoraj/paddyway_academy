import 'package:flutter/material.dart';
import 'package:paddyway_academy/widgets/section_card.dart';

class SectionsPage extends StatelessWidget {
  const SectionsPage({Key? key, required this.sections, required this.unit})
      : super(key: key);
  final List sections;
  final String unit;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(unit),
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(
          horizontal: 20.0,
        ),
        children: [
          for (String section in sections)
            SectionCard(
              sectionName: section,
              unitId: unit,
            ),
        ],
      ),
    );
  }
}
