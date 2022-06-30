import 'package:flutter/material.dart';
import 'package:paddyway_academy/models/document_model.dart';

import '../services/firebase/firebase_storage.dart';

class DocumentCard extends StatelessWidget {
  const DocumentCard({Key? key, required this.document}) : super(key: key);
  final DocumentModel document;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SizedBox(
        height: 100,
        child: Material(
          color: Colors.grey[500],
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
                child: Image.asset("assets/images/pdf icon.png"),
              ),
              Expanded(
                child: Text(
                  document.name,
                  style: const TextStyle(color: Colors.black),
                ),
              ),
              GestureDetector(
                onTap: () {
                  FireStorage.downloadDoc(context, document);
                },
                child: const Icon(
                  Icons.download,
                  color: Colors.red,
                  size: 30,
                ),
              ),
              const SizedBox(
                width: 10,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
