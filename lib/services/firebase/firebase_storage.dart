import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:paddyway_academy/models/document_model.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';

class FireStorage {
  static downloadDoc(BuildContext context, DocumentModel doc) async {
    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
      content: Text('Downloading...'),
    ));
    PermissionStatus status = await Permission.manageExternalStorage.status;
    if (status == PermissionStatus.granted) {
      Directory? dir = Directory('storage/emulated/0/Paddyway Academy/pdfs');
      print("hii");
      if (await dir.exists() != true) {
        print("1");
        await Directory('storage/emulated/0/Paddyway Academy')
            .create()
            .then((Directory directory) async {
          await Directory('storage/emulated/0/Paddyway Academy/pdfs')
              .create()
              .then((Directory directory) {});
        }).catchError((e) async {
          print('2');
          dir = await getExternalStorageDirectory();
          print(e);
        });
        print(3);
      }
      print(dir);
      String fileName = '${dir!.path}/${doc.name}';
      File downloadToFile = File(fileName);
      downloadToFile.setLastModified(DateTime.now());
      downloadToFile.setLastAccessed(DateTime.now());
      for (int i = 1; i < 100; i++) {
        if (await downloadToFile.exists()) {
          if (i == 1) {
            fileName =
                fileName.split('.')[0] + '($i).' + fileName.split('.').last;
          } else {
            fileName = fileName
                    .split('.')[0]
                    .substring(0, fileName.split('.')[0].length - 3) +
                '($i).' +
                fileName.split('.').last;
          }
          downloadToFile = File(fileName);
        } else {
          try {
            String ref = '${doc.lesson}/${doc.name}';
            await FirebaseStorage.instance
                .ref(ref)
                .writeToFile(downloadToFile)
                .whenComplete(() {})
                .catchError((e) {});
          } on FirebaseException catch (e) {
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              content: Text(e.toString()),
            ));
          }
          ScaffoldMessenger.of(context).clearSnackBars();
          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            content: Text('Download Completed'),
          ));
          break;
        }
      }
    } else {
      ScaffoldMessenger.of(context).clearSnackBars();
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text('Permission Denied'),
      ));
    }
  }
}
