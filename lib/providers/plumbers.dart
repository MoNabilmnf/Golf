import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'file:///F:/android/work/golf-project-flutter/lib/models/credit.dart';
import 'file:///F:/android/work/golf-project-flutter/lib/models/plumber.dart';
import 'file:///F:/android/work/golf-project-flutter/lib/models/plumber_bill.dart';
import 'package:golf_app/utils/constants.dart';
import 'package:http/http.dart';

class Plumbers with ChangeNotifier {
  final int _userId;

  Plumbers(this._userId);

  List<Plumber> _plumbers = [];
  List<List<Credit>> _credits = [];
  List<List<PlumberBill>> _plumberBills = [];

  List<List<PlumberBill>> get plumberBills {
    return _plumberBills;
  }

  List<Plumber> get plumbers {
    return [..._plumbers];
  }

  List<List<Credit>> get credits {
    return _credits;
  }

  Future<void> getPlumbers() async {
    final String url = '$API_URL/getPlumbers/$_userId';
    Response response = await get(url);
    final decodedResponseBody = json.decode(response.body) as List<dynamic>;
    print(decodedResponseBody.toString());
    _plumbers = decodedResponseBody
        .map((item) => Plumber(
              code: item['code'],
              plumberName: item['plumberName'],
              nationalId: item['nationalId'],
              plumberPhone: item['telephoneNumber'],
              governorate: item['governorate'],
              points: item['points'],
            ))
        .toList();
    notifyListeners();
  }

  Future<void> getCredits() async {
    final String url = '$API_URL/getPlumbers/$_userId';
    Response response = await get(url);
    final decodedResponseBody = json.decode(response.body) as List<dynamic>;
    print(decodedResponseBody.toString());
    _credits = decodedResponseBody.map((map) {
      return (map['credit'] as List<dynamic>)
          .map((credit) => Credit(
                title: credit['title'],
                value: credit['value'],
              ))
          .toList();
    }).toList();
    notifyListeners();
  }

  Future<void> getBills() async {
    final String url = '$API_URL/getPlumbers/$_userId';
    Response response = await get(url);
    final decodedResponseBody = json.decode(response.body) as List<dynamic>;
    print(decodedResponseBody.toString());
    _plumberBills = decodedResponseBody.map((map) {
      return (map['bills'] as List<dynamic>)
          .map((bill) => PlumberBill(
                id: bill['id'],
                date: bill['date'],
                clientName: bill['clientName'],
                billNumber: bill['billNumber'],
                merchantName: bill['merchantName'],
                reward: bill['reward'],
              ))
          .toList();
    }).toList();
    notifyListeners();
  }
}
