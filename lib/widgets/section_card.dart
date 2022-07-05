import 'package:flutter/material.dart';
import 'package:paddyway_academy/constants.dart';
import 'package:paddyway_academy/pages/all_videos_page.dart';
import 'package:paddyway_academy/theme_info.dart';

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
          color: ThemeInfo.cardColor,
        ),
        padding: const EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Text(
                sectionName,
                style: TextStyle(
                    color: ThemeInfo.contrastPrimaryTextColor,
                    fontSize: 24,
                    fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(
              height: 10,
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
                        color: ThemeInfo.sectionVideoButtonColor,
                        child: Text(
                          sectionVideoButtonText,
                        ),
                      ),
                      MyFlatButton(
                        radius: 30,
                        color: ThemeInfo.sectionDocumentsButtonColor,
                        child: Text(
                          sectionDocumentsButtonText,
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
                          color: ThemeInfo.sectionVideoButtonColor,
                          child: Text(
                            sectionVideoButtonText,
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        MyFlatButton(
                          radius: 30,
                          color: ThemeInfo.sectionDocumentsButtonColor,
                          child: Text(
                            sectionDocumentsButtonText,
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
