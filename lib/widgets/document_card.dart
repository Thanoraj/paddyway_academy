import 'package:flutter/material.dart';
import 'package:paddyway_academy/constants.dart';
import 'package:paddyway_academy/models/document_model.dart';
import 'package:paddyway_academy/pages/home_page.dart';
import 'package:paddyway_academy/theme_info.dart';
import 'package:url_launcher/url_launcher.dart';

class DocumentCard extends StatelessWidget {
  const DocumentCard({Key? key, required this.document}) : super(key: key);
  final Map document;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GestureDetector(
        onTap: () async {
          DocumentModel doc = DocumentModel();
          doc.lesson = selectedUnit!;
          doc.name = document['name'];
          doc.url = document['url'];
          doc.lesson = selectedUnit!;
          await launchUrl(
            Uri.parse(doc.url),
            mode: LaunchMode.externalApplication,
          );
        },
        child: SizedBox(
          height: 100,
          child: Material(
            color: ThemeInfo.cardColor,
            elevation: 5,
            borderRadius: BorderRadius.circular(10),
            child: Row(
              children: [
                const SizedBox(
                  width: 0,
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 18.0, horizontal: 8),
                  child: Image.asset(pdfIcon),
                ),
                Expanded(
                  child: Text(
                    document['name'],
                    style: TextStyle(color: ThemeInfo.contrastPrimaryTextColor),
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
