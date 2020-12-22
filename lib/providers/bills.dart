import 'package:flutter/foundation.dart';
import 'file:///F:/android/work/golf-project-flutter/lib/models/bill.dart';

class Bills with ChangeNotifier {
  List<Bill> _bills = [];

  List<Bill> get bills {
    return [..._bills];
  }
}
