import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

import '../model/model.dart';

enum Status { loading, error, done, initial }

const randomUserUrl = 'https://randomuser.me/api?results=10';

class DataProvider extends ChangeNotifier {
  Status status = Status.initial;
  User? _user;

  User? get user => _user;

  Future<void> getUser() async {
    status = Status.loading;

    try {
      http.Response response = await http.get(Uri.parse(randomUserUrl));
      if (response.statusCode == 200) {
        _user = User.fromJson(response.body);
        status = Status.done;
      } else {
        debugPrint("Error: status code: ${response.statusCode}");
        status = Status.error;
      }
    } catch (e) {
      debugPrint(e.toString());
      status = Status.error;
    }
    notifyListeners();
  }
}
