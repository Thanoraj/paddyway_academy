import 'package:paddyway_academy/services/firebase/firestore.dart';
import 'package:paddyway_academy/services/local_storage.dart';

class UserManager {
  static Future<bool?> checkLoginStatus() async {
    bool? isLoggedIn = await LocalStorageManager.getLoginStatus();

    if (isLoggedIn == true) {
      String? userID = await LocalStorageManager.getUserID();
      await Firestore.fetchUserData(userID!);
    }

    return isLoggedIn;
  }

  static validateUser(String userID) async {
    bool? isValid = await Firestore.checkValidity(userID);
    if (isValid == true) {
      await LocalStorageManager.saveLoginStatus();
      await LocalStorageManager.saveUserID(userID);
      await Firestore.updateValidity(userID);
      await Firestore.fetchUserData(userID);
    } else if (isValid == false) {
      await Firestore.saveFalseAttempt(userID);
    }
  }
}
