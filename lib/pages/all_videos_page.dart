import 'package:flutter/material.dart';
import 'package:paddyway_academy/widgets/document_card.dart';
import 'package:paddyway_academy/widgets/long_video_card.dart';

class AllItemsPage extends StatelessWidget {
  const AllItemsPage(
      {Key? key, required this.itemsList, required this.title, this.type})
      : super(key: key);
  final List itemsList;
  final String title;
  final String? type;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: ListView.builder(
          itemCount: itemsList.length,
          itemBuilder: (context, index) {
            return type == "doc"
                ? DocumentCard(document: itemsList[index])
                : LongVideoCard(videoInfo: itemsList[index]);
          }),
    );
  }
}
