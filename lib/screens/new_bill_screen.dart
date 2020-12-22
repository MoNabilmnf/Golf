import 'package:flutter/material.dart';
import 'package:golf_app/screens/new_bill_categories_screen.dart';
import 'package:golf_app/utils/constants.dart';

class NewBillScreen extends StatelessWidget {
  static const ROUTE_NAME = '/newBillScreen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('إضافة معاينة جديدة'),
        backgroundColor: mainColor,
      ),
      body: SingleChildScrollView(
        child: Form(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                TextFormField(
                  decoration: InputDecoration(
                    hintText: 'إسم المستخدم',
                  ),
                ),
                TextFormField(
                  decoration: InputDecoration(
                    hintText: 'رقم تليفون العميل',
                  ),
                ),
                TextFormField(
                  decoration: InputDecoration(
                    hintText: 'أدخل إسم الفنى للبحث',
                  ),
                ),
                TextFormField(
                  decoration: InputDecoration(
                    hintText: 'رقم تليفون الفنى',
                  ),
                ),
                TextFormField(
                  decoration: InputDecoration(
                    hintText: 'أدخل إسم التاجر للبحث',
                  ),
                ),
                TextFormField(
                  decoration: InputDecoration(
                    hintText: 'رقم تليفون التاجر',
                  ),
                ),
                TextFormField(
                  decoration: InputDecoration(
                    hintText: 'رقم الفاتورة',
                  ),
                ),
                Row(
                  children: [
                    Expanded(
                      child: DropdownButton(
                        isExpanded: true,
                        items: [
                          DropdownMenuItem(
                            child: Text('المحافظة'),
                          ),
                          DropdownMenuItem(
                            child: Text('المحافظة'),
                          ),
                          DropdownMenuItem(
                            child: Text('المحافظة'),
                          ),
                          DropdownMenuItem(
                            child: Text('المحافظة'),
                          ),
                        ],
                        onChanged: (i) {},
                      ),
                    ),
                    Expanded(
                      child: DropdownButton(
                        isExpanded: true,
                        items: [
                          DropdownMenuItem(
                            child: Text('المنطقة'),
                          ),
                          DropdownMenuItem(
                            child: Text('المنطقة'),
                          ),
                          DropdownMenuItem(
                            child: Text('المنطقة'),
                          ),
                          DropdownMenuItem(
                            child: Text('المنطقة'),
                          ),
                        ],
                        onChanged: (i) {},
                      ),
                    ),
                  ],
                ),
                TextFormField(
                  decoration: InputDecoration(
                    hintText: 'العنوان',
                  ),
                  minLines: 3,
                  maxLines: 10,
                ),
                Row(
                  children: [
                    Expanded(
                      child: TextFormField(
                        decoration: InputDecoration(hintText: 'صاعد'),
                      ),
                    ),
                    VerticalDivider(
                      color: Colors.black12,
                    ),
                    Expanded(
                      child: TextFormField(
                        decoration: InputDecoration(hintText: 'حمام'),
                      ),
                    ),
                    VerticalDivider(
                      color: Colors.black12,
                    ),
                    Expanded(
                      child: TextFormField(
                        decoration: InputDecoration(hintText: 'مطبخ'),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 16,
                ),
                Row(
                  children: [
                    Spacer(),
                    GestureDetector(
                      child: Container(
                        height: 100,
                        width: 100,
                        color: Colors.lightBlue,
                        child: Icon(
                          Icons.add,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    Spacer(),
                    GestureDetector(
                      child: Container(
                        height: 100,
                        width: 100,
                        color: Colors.lightBlue,
                        child: Icon(
                          Icons.add,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    Spacer(),
                    GestureDetector(
                      onTap: () {},
                      child: Container(
                        height: 100,
                        width: 100,
                        color: Colors.lightBlue,
                        child: Icon(
                          Icons.add,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    Spacer(),
                  ],
                ),
                SizedBox(
                  height: 16,
                ),
                RaisedButton(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      'التالى',
                      style: const TextStyle(
                        fontSize: 24,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  color: mainColor,
                  onPressed: () {
                    Navigator.of(context)
                        .pushNamed(NewBillCategoriesScreen.ROUTE_NAME);
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
