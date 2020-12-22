import 'package:flutter/material.dart';
import 'package:golf_app/screens/bill_print_preview.dart';
import 'package:golf_app/utils/constants.dart';

class NewBillCategoriesScreen extends StatefulWidget {
  static const ROUTE_NAME = '/newBillCategoriesScreen';

  @override
  _NewBillCategoriesScreenState createState() =>
      _NewBillCategoriesScreenState();
}

class _NewBillCategoriesScreenState extends State<NewBillCategoriesScreen> {
  final _pageViewController = PageController(
    initialPage: 1,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('عمل معاينة'),
        backgroundColor: mainColor,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: PageView.builder(
              controller: _pageViewController,
              itemCount: 3,
              onPageChanged: (i) {},
              itemBuilder: (context, i) {
                return PageViewBody();
              },
            ),
          ),
          RaisedButton(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'معاينة الفاتورة',
                style: const TextStyle(
                  fontSize: 24,
                  color: Colors.white,
                ),
              ),
            ),
            elevation: 0,
            color: mainColor,
            materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
            onPressed: () {
              Navigator.of(context).pushNamed(BillPrintPreview.ROUTE_NAME);
            },
          ),
        ],
      ),
    );
  }
}

class PageViewBody extends StatefulWidget {
  @override
  _PageViewBodyState createState() => _PageViewBodyState();
}

class _PageViewBodyState extends State<PageViewBody>
    with AutomaticKeepAliveClientMixin {
  void _showAlertDialog() {
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) {
          return AlertDialog(
            title: Text('تحذير'),
            content: Text('هل أنت متأكد من حفظ الفاتورة؟'),
            actions: [
              FlatButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text('حفظ'),
              ),
              FlatButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text('إلغاء'),
              ),
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'إسم الصنف',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: 15,
                itemBuilder: (context, j) {
                  return Card(
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Row(
                        children: [
                          Expanded(
                            child: Text('قطعة j فى صفحة i'),
                          ),
                          Expanded(
                            child: TextFormField(
                              decoration: InputDecoration(
                                hintText: 'العدد',
                              ),
                              keyboardType: TextInputType.number,
                              minLines: 1,
                              maxLines: 1,
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}
