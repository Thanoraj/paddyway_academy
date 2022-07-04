import 'package:flutter/material.dart';
import 'package:paddyway_academy/pages/all_videos_page.dart';

import 'my_flat_button.dart';

class SectionCard extends StatelessWidget {
  const SectionCard({Key? key, required this.sectionName, required this.unitId})
      : super(key: key);
  final String sectionName;
  final String unitId;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
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
                sectionName,
                style: const TextStyle(color: Colors.white70, fontSize: 16),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            MediaQuery.of(context).size.width > 350
                ? Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      MyFlatButton(
                        radius: 30,
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => AllItemsPage(
                                        title: sectionName,
                                        unit: unitId,
                                      )));
                        },
                        color: Color(0xffe86c6c),
                        child: Text(
                          "View All Videos",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                      MyFlatButton(
                        radius: 30,
                        color: Color(0xff6ca1e7),
                        child: const Text(
                          "View All e-Notes",
                          style: TextStyle(color: Colors.white),
                        ),
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => AllItemsPage(
                                        title: sectionName,
                                        unit: unitId,
                                        type: 'documents',
                                      )));
                        },
                      )
                    ],
                  )
                : Center(
                    child: Column(
                      children: [
                        MyFlatButton(
                          radius: 30,
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => AllItemsPage(
                                          title: sectionName,
                                          unit: unitId,
                                        )));
                          },
                          color: const Color(0xffe86c6c),
                          child: const Text(
                            " View All Videos ",
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        MyFlatButton(
                          radius: 30,
                          color: const Color(0xff6ca1e7),
                          child: const Text(
                            "View All e-Notes",
                            style: TextStyle(color: Colors.white),
                          ),
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => AllItemsPage(
                                          title: sectionName,
                                          unit: unitId,
                                          type: 'documents',
                                        )));
                          },
                        )
                      ],
                    ),
                  )
          ],
        ),
      ),
    );
  }
}
