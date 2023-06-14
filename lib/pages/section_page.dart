import 'package:flutter/material.dart';
import 'package:paddyway_academy/widgets/section_card.dart';

import '../constants.dart';
import '../theme_info.dart';
import '../widgets/my_flat_button.dart';
import 'all_videos_page.dart';
import 'home_page.dart';

class SectionsPage extends StatelessWidget {
  const SectionsPage({Key? key, required this.sections, required this.unit})
      : super(key: key);
  final List sections;
  final String unit;
  final double cardWidth = 280;
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: Text(unit),
      ),
      body: width < 750
          ? ListView(
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
            )
          : GridView.count(
              padding: EdgeInsets.symmetric(
                  vertical: 20,
                  horizontal:
                      (width - (width ~/ cardWidth).toInt() * cardWidth) /
                          ((width ~/ cardWidth).toInt() + 1)),
              crossAxisCount: (width ~/ cardWidth).toInt(),
              mainAxisSpacing: 20,
              crossAxisSpacing:
                  (width - (width ~/ cardWidth).toInt() * cardWidth) /
                      ((width ~/ cardWidth).toInt() + 1),
              children: [
                for (String section in sections)
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: ThemeInfo.cardColor,
                      ),
                      padding: const EdgeInsets.all(15),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 8.0),
                            child: Text(
                              section,
                              style: TextStyle(
                                  color: ThemeInfo.contrastPrimaryTextColor,
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          const SizedBox(),
                          MyFlatButton(
                            radius: 30,
                            onTap: () {
                              selectedSection = section;
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => AllItemsPage(
                                            title: section,
                                            unit: unit,
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
                                            title: section,
                                            unit: unit,
                                            type: 'documents',
                                          )));
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
              ],
            ),
    );
  }
}
