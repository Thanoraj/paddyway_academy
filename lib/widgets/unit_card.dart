import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:paddyway_academy/constants.dart';
import 'package:paddyway_academy/pages/home_page.dart';
import 'package:paddyway_academy/pages/section_page.dart';
import 'package:paddyway_academy/theme_info.dart';

import 'my_flat_button.dart';

class UnitCard extends StatelessWidget {
  const UnitCard({Key? key, required this.unit}) : super(key: key);
  final Map unit;

  @override
  Widget build(BuildContext context) {
    print("ghf");
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 20.0,
        vertical: 8,
      ),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(
            15,
          ),
          color: ThemeInfo.cardColor,
        ),
        padding: const EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 8.0,
              ),
              child: Text(
                unit['unit'],
                style: TextStyle(
                  color: ThemeInfo.contrastPrimaryTextColor,
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Center(
              child: MyFlatButton(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                onTap: () async {
                  print("sections");
                  selectedUnit = unit['unit'];
                  List sections = [];
                  print(sections);
                  await FirebaseFirestore.instance
                      .collection("lessons")
                      .doc(unit['unit'])
                      .get()
                      .then((value) {
                    sections = value['sections'];
                  });
                  print(sections);
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => SectionsPage(
                        sections: sections,
                        unit: unit["unit"],
                      ),
                    ),
                  );
                },
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      sectionCardButtonText,
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    const Icon(
                      Icons.arrow_forward,
                      size: 15,
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
