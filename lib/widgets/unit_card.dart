import 'package:flutter/material.dart';
import 'package:paddyway_academy/pages/home_page.dart';
import 'package:paddyway_academy/pages/section_page.dart';

import 'my_flat_button.dart';

class UnitCard extends StatelessWidget {
  const UnitCard({Key? key, required this.unit}) : super(key: key);
  final Map unit;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 8),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: const Color(0xff191c2d),
        ),
        padding: const EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Text(
                unit['unit'],
                style: const TextStyle(color: Colors.white70, fontSize: 16),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Center(
              child: MyFlatButton(
                onTap: () {
                  selectedUnit = unit['unit'];
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => SectionsPage(
                              sections: unit['sections'], unit: unit["unit"])));
                },
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: const [
                    Text(
                      "View sections",
                      style: TextStyle(color: Colors.white),
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Icon(
                      Icons.arrow_forward,
                      size: 15,
                      color: Colors.white,
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
