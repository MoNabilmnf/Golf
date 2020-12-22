import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'file:///F:/android/work/golf-project-flutter/lib/models/price_image.dart';
import 'file:///F:/android/work/golf-project-flutter/lib/models/price_item.dart';
import 'package:golf_app/utils/constants.dart';
import 'package:http/http.dart';

class PriceItems with ChangeNotifier {
  List<PriceItem> _priceItems = [];

  List<PriceItem> get priceItems {
    return [..._priceItems];
  }

  Future<void> getPriceItems() async {
    try {
      Response response = await get('$API_URL/getPriceLists');
      final decodedResponseBody = json.decode(response.body) as List<dynamic>;
      print(decodedResponseBody.toString());
      _priceItems = decodedResponseBody
          .map(
            (item) => PriceItem(
              title: item['title'],
              date: item['date'],
              priceImages: (item['items'] as List<dynamic>)
                  .map((imageItem) => PriceImage(
                      url: imageItem['url'], title: imageItem['title']))
                  .toList(),
            ),
          )
          .toList();
      notifyListeners();
    } catch (error) {
      print(error.toString());
    }
  }
}
