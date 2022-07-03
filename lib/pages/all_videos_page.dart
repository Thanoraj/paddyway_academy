import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:paddyway_academy/widgets/document_card.dart';
import 'package:paddyway_academy/widgets/long_video_card.dart';

class AllItemsPage extends StatefulWidget {
  const AllItemsPage(
      {Key? key, required this.title, this.type, required this.unit})
      : super(key: key);
  final String title;
  final String unit;
  final String? type;

  @override
  State<AllItemsPage> createState() => _AllItemsPageState();
}

class _AllItemsPageState extends State<AllItemsPage> {
  late Future<List> _getItemList;

  @override
  initState() {
    super.initState();
    _getItemList = getItemList();
  }

  List itemsList = [];

  Future<List> getItemList() async {
    print("in");
    itemsList = [];
    print(widget.unit);
    print(widget.title);
    print(widget.type);
    await FirebaseFirestore.instance
        .collection("lessons")
        .doc(widget.unit)
        .collection(widget.title)
        .doc(widget.type ?? "videos")
        .get()
        .then((value) {
      print(value.data());
      itemsList = value.data()![widget.type ?? 'videos'];
    }).catchError((e) {
      print(e);
    });
    print(itemsList);
    return itemsList;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: FutureBuilder(
        future: _getItemList,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return itemsList.isNotEmpty
                ? ListView.builder(
                    itemCount: itemsList.length,
                    itemBuilder: (context, index) {
                      return widget.type == "documents"
                          ? DocumentCard(document: itemsList[index])
                          : LongVideoCard(videoInfo: itemsList[index]);
                    })
                : Center(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 40.0),
                      child: Text(
                        "No ${widget.type ?? 'videos'} available in this section now",
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 18),
                      ),
                    ),
                  );
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}
