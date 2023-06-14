import 'package:flutter/foundation.dart';
import 'package:paddyway_academy/pages/landing_page.dart';
import 'package:paddyway_academy/secrets.dart';
import 'package:paddyway_academy/services/firebase/firestore.dart';
import 'package:paddyway_academy/services/local_storage.dart';

Map? cookieMap;

class UserManager {
  static Future<bool?> checkLoginStatus() async {
    bool? isLoggedIn;
    //document.cookie = "loggedIn=true";
    if (kIsWeb) {
      // final cookie = document.cookie!;
      //
      // if (cookie.isEmpty) {
      //   isLoggedIn = false;
      // } else {
      //   final entity = cookie.split("; ").map((item) {
      //     final split = item.split("=");
      //     return MapEntry(split[0], split[1]);
      //   });
      //   cookieMap = Map.fromEntries(entity);
      //   isLoggedIn = cookieMap!['loggedIn'] == "true";
      //   userID = cookieMap!['userID'];
      // }
    } else {
      isLoggedIn = await LocalStorageManager.getLoginStatus();
    }
    if (isLoggedIn == true) {
      if (!kIsWeb) {
        userID = (await LocalStorageManager.getUserID())!;
      }
      await Firestore.fetchUserData(userID);
      if (currentUser == null) {
        await LocalStorageManager.saveLoginStatus(false);
        isLoggedIn = false;
      }
    }
    print('isLoggedIn3$isLoggedIn');

    return isLoggedIn;
  }

  static validateUser(String userID) async {
    bool? isValid;
    isValid = !bypassedCodes.contains(userID)
        ? await Firestore.checkValidity(userID)
        : true;

    if (isValid == true) {
      try {
        if (kIsWeb) {
          //document.cookie = "loggedIn=true";
          //document.cookie = "userID=$userID";
        } else {
          await LocalStorageManager.saveLoginStatus(true);
          await LocalStorageManager.saveUserID(userID);
        }
      } on Exception catch (e) {
        print(e);
      }
      await Firestore.updateValidity(userID);
      await Firestore.fetchUserData(userID);
    } else if (isValid == false) {
      await Firestore.saveFalseAttempt(userID);
    }
  }
}
