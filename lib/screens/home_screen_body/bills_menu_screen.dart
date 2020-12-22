import 'package:flutter/material.dart';
import 'package:golf_app/providers/bills.dart';
import 'package:provider/provider.dart';

class BillsMenuScreen extends StatefulWidget {
  static const ROUTE_NAME = '/billsMenuScreen';

  @override
  _BillsMenuScreenState createState() => _BillsMenuScreenState();
}

class _BillsMenuScreenState extends State<BillsMenuScreen> {
  @override
  Widget build(BuildContext context) {
    final billsData = Provider.of<Bills>(context);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        children: [
          TextField(
            decoration: InputDecoration(
              hintText: 'بحث',
              suffixIcon: Icon(Icons.search),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: billsData.bills.length,
              itemBuilder: (context, i) {
                return Card(
                  child: Column(
                    children: [
                      Text('معاينة رقم: '),
                      Text('التاجر: '),
                      Text('العميل: '),
                      Text('العنوان: '),
                      Text('تاريخ الإرسال: '),
                      RaisedButton(
                        child: Text('عرض'),
                        onPressed: () {},
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
