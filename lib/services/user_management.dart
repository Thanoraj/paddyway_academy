import 'package:paddyway_academy/pages/landing_page.dart';
import 'package:paddyway_academy/secrets.dart';
import 'package:paddyway_academy/services/firebase/firestore.dart';
import 'package:paddyway_academy/services/local_storage.dart';

class UserManager {
  static Future<bool?> checkLoginStatus() async {
    bool? isLoggedIn = await LocalStorageManager.getLoginStatus();

    if (isLoggedIn == true) {
      String? userID = await LocalStorageManager.getUserID();
      await Firestore.fetchUserData(userID!);
      if (currentUser == null) {
        await LocalStorageManager.saveLoginStatus(false);
        isLoggedIn = false;
      }
    }

    return isLoggedIn;
  }

  static validateUser(String userID) async {
    bool? isValid;
    isValid = !bypassedCodes.contains(userID)
        ? await Firestore.checkValidity(userID)
        : true;
    if (isValid == true) {
      await LocalStorageManager.saveLoginStatus(true);
      await LocalStorageManager.saveUserID(userID);
      await Firestore.updateValidity(userID);
      await Firestore.fetchUserData(userID);
    } else if (isValid == false) {
      await Firestore.saveFalseAttempt(userID);
    }
  }
}
