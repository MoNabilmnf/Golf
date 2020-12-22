import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:golf_app/Global.dart';
import 'package:golf_app/exceptions/auth_exception.dart';
import 'package:golf_app/utils/constants.dart';
import 'package:http/http.dart';

class Auth with ChangeNotifier {
  int id;
  String name;
  int typeId;
  String typeName;
  String govName;
  int visitTarget;
  int achievedTarget;
  int restTarget;

  bool isAuth() {
    return id != null;
  }

  Future<int> loginUser(String username, String password) async {
    try {
      Response response = await post('$API_URL/login', body: {
        'username': username,
        'password': password,
      });
      final Map<String, dynamic> decodedResponseBody =
          json.decode(response.body);
      if (response.statusCode >= 400) {
        throw AuthException(decodedResponseBody['message']);
      }
      print(decodedResponseBody);
      id = decodedResponseBody['id'];
      name = decodedResponseBody['name'];
      typeId = decodedResponseBody['typeId'];
      typeName = decodedResponseBody['type'];
      govName = decodedResponseBody['extraData']['gov']['name'];
      visitTarget = decodedResponseBody['extraData']['visitTarget'];
      achievedTarget = decodedResponseBody['extraData']['achievedTarget'];
      restTarget = decodedResponseBody['extraData']['restTarget'];
      notifyListeners();
      return id;
    } catch (error) {
      throw error;
    }
  }

  void logoutUser() {
    id = null;
    name = null;
    typeId = null;
    typeName = null;
    govName = null;
    visitTarget = null;
    achievedTarget = null;
    restTarget = null;
    notifyListeners();
  }
}
