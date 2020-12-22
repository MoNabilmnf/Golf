import 'file:///F:/android/work/golf-project-flutter/lib/models/location.dart';
import 'package:flutter/foundation.dart';
import 'file:///F:/android/work/golf-project-flutter/lib/models/plumber.dart';
import 'file:///F:/android/work/golf-project-flutter/lib/models/product.dart';

class Bill {
  int id;

  List<Product> products;

  String clientName;
  String clientPhone;

  int merchantId;
  String merchantName;
  String merchantPhone;

  Plumber plumber;

  String address;
  DateTime date;

  String billNumber;

  int governorateId;
  int districtId;

  int elevatorsCount;
  int bathroomsCount;
  int kitchensCount;

  Location currentLocation;

  bool isSent;

  // TODO: Add video property

  Bill({
    @required this.id,
    @required this.clientName,
    @required this.clientPhone,
    @required this.merchantId,
    @required this.merchantName,
    @required this.merchantPhone,
    @required this.address,
    @required this.date,
    @required this.billNumber,
    @required this.governorateId,
    @required this.districtId,
    @required this.elevatorsCount,
    @required this.bathroomsCount,
    @required this.kitchensCount,
    @required this.currentLocation,
    this.isSent = false,
    @required this.products,
  });
}
