import 'package:flutter/foundation.dart';
import 'package:ngo_app/services/database.dart';

class Data extends ChangeNotifier {
  Map<String, dynamic> data = {"name": " ", "email": " ", "number": " "};

  Future updateAccount(uid) async {
    data = await DatabaseService(uid: uid).getData();
    notifyListeners();
  }
}
