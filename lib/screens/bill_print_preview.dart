import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:golf_app/utils/constants.dart';

class BillPrintPreview extends StatelessWidget {
  static const ROUTE_NAME = '/billPrintPreview';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('طباعة الفاتورة'),
        backgroundColor: mainColor,
      ),
      body: SingleChildScrollView(
        physics: ScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Center(
              child: Text(
                'البيانات الشخصية',
                style: kMainTitleStyle,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Table(
                border: TableBorder.symmetric(
                  inside: BorderSide(
                    color: Colors.black12,
                  ),
                  outside: BorderSide(
                    color: Colors.black,
                    width: 1,
                  ),
                ),
                children: [
                  TableRow(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          'إسم المستخدم',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text('زياد محمد'),
                      ),
                    ],
                  ),
                  TableRow(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          'رقم تليفون العميل',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text('01012345678'),
                      ),
                    ],
                  ),
                  TableRow(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          'إسم الفنى',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text('زياد محمد'),
                      ),
                    ],
                  ),
                  TableRow(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          'رقم تليفون الفنى',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text('01012345678'),
                      ),
                    ],
                  ),
                  TableRow(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          'إسم التاجر',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text('زياد محمد'),
                      ),
                    ],
                  ),
                  TableRow(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          'رقم تليفون التاجر',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text('01012345678'),
                      ),
                    ],
                  ),
                  TableRow(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          'رقم الفاتورة',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text('535421'),
                      ),
                    ],
                  ),
                  TableRow(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          'العنوان',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text('مصر الجديدة'),
                      ),
                    ],
                  ),
                  TableRow(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          'صاعد',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text('9'),
                      ),
                    ],
                  ),
                  TableRow(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          'حمام',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text('12'),
                      ),
                    ],
                  ),
                  TableRow(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          'مطبخ',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text('5'),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Divider(),
            ListView.builder(
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: 5,
              itemBuilder: (context, i) {
                return Column(
                  children: [
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(
                          Icons.loyalty,
                          color: i == 0
                              ? Colors.red
                              : i == 1
                                  ? Colors.lightBlue
                                  : Colors.yellow,
                        ),
                        SizedBox(
                          width: 16,
                        ),
                        Text(
                          'كوبون عشوائى',
                          style: kMainTitleStyle,
                        ),
                      ],
                    ),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: DataTable(
                        showBottomBorder: true,
                        dataRowHeight: 60,
                        headingRowColor: MaterialStateColor.resolveWith(
                                (state) => Colors.black12),
                        columns: <DataColumn>[
                          DataColumn(
                            label: Text(
                              'م',
                              style: kTableRowColumnTitleStyle,
                            ),
                            numeric: true,
                          ),
                          DataColumn(
                            label: Text(
                              'إسم المنتج',
                              style: kTableRowColumnTitleStyle,
                            ),
                          ),
                          DataColumn(
                            label: Text(
                              'الكمية',
                              style: kTableRowColumnTitleStyle,
                            ),
                          ),
                          DataColumn(
                            label: Text(
                              'السعر',
                              style: kTableRowColumnTitleStyle,
                            ),
                          ),
                          DataColumn(
                            label: Text(
                              'النقاط',
                              style: kTableRowColumnTitleStyle,
                            ),
                          ),
                          DataColumn(
                            label: Text(
                              'إجمالى السعر',
                              style: kTableRowColumnTitleStyle,
                            ),
                          ),
                          DataColumn(
                            label: Text(
                              'إجمالى النقاط',
                              style: kTableRowColumnTitleStyle,
                            ),
                          ),
                        ],
                        rows: [
                          DataRow(
                            cells: <DataCell>[
                              DataCell(Text('1')),
                              DataCell(Text('بولى')),
                              DataCell(Text('10')),
                              DataCell(Text('10')),
                              DataCell(Text('5')),
                              DataCell(Text('50')),
                              DataCell(Text('50')),
                            ],
                          ),
                          DataRow(
                            cells: <DataCell>[
                              DataCell(Text('2')),
                              DataCell(Text('الأبيض')),
                              DataCell(Text('10')),
                              DataCell(Text('10')),
                              DataCell(Text('5')),
                              DataCell(Text('50')),
                              DataCell(Text('50')),
                            ],
                          ),
                        ],
                      ),
                    ),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              children: [
                                Text(
                                  'إجمالى الكمية',
                                  style: kTableRowColumnTitleStyle,
                                ),
                                Text('20'),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              children: [
                                Text(
                                  'إجمالى السعر',
                                  style: kTableRowColumnTitleStyle,
                                ),
                                Text('50'),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              children: [
                                Text(
                                  'إجمالى النقاط',
                                  style: kTableRowColumnTitleStyle,
                                ),
                                Text('50'),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              children: [
                                Text(
                                  'عدد الكوبونات',
                                  style: kTableRowColumnTitleStyle,
                                ),
                                Text('560'),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              children: [
                                Text(
                                  'المتبقى',
                                  style: kTableRowColumnTitleStyle,
                                ),
                                Text('50'),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                );
              },
            ),
            SizedBox(
              height: 16,
            ),
            RaisedButton(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'إرسال الفاتورة',
                  style: const TextStyle(
                    fontSize: 24,
                    color: Colors.white,
                  ),
                ),
              ),
              color: mainColor,
              elevation: 0,
              materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}
// RaisedButton(
// child: Padding(
// padding: const EdgeInsets.all(8.0),
// child: Text(
// 'إرسال الفاتورة',
// style: const TextStyle(fontSize: 24),
// ),
// ),
// elevation: 0,
// materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
// onPressed: () {
// Navigator.of(context).pushNamed(BillPrintPreview.ROUTE_NAME);
// },
// ),
/*Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Text(
                        'عنوان القسم',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: Text('م'),
                          ),
                          Expanded(
                            child: Text('المنتج'),
                          ),
                          Expanded(
                            child: Text('الكمية'),
                          ),
                          Expanded(
                            child: Text('الوحدة'),
                          ),
                          Expanded(
                            child: Text('إجمالى'),
                          ),
                        ],
                      ),
                      Expanded(
                        child: ListView.separated(
                          itemCount: 5,
                          itemBuilder: (context, i) {
                            return Row(
                              children: [
                                Expanded(
                                  child: Text('1'),
                                ),
                                Expanded(
                                  child: Text('محبس'),
                                ),
                                Expanded(
                                  child: Text('6'),
                                ),
                                Expanded(
                                  child: Text('40'),
                                ),
                                Expanded(
                                  child: Text('240'),
                                ),
                              ],
                            );
                          },
                          separatorBuilder: (context, i) {
                            return Divider();
                          },
                        ),
                      ),
                    ],
                  ),
                ) */
