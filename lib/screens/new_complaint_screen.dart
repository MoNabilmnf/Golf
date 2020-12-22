import 'package:flutter/material.dart';
import 'package:golf_app/utils/constants.dart';

class NewComplaintScreen extends StatelessWidget {
  static const ROUTE_NAME = '/newComplaintScreen';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('إضافة شكوى'),
        backgroundColor: mainColor,
      ),
      body: SafeArea(
        child: Form(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                TextFormField(
                  decoration: InputDecoration(
                    hintText: 'عنوان الشكوى',
                    labelText: 'عنوان الشكوى',
                  ),
                ),
                TextFormField(
                  decoration: InputDecoration(
                    hintText: 'تفاصيل الشكوى',
                  ),
                  minLines: 5,
                  maxLines: 8,
                ),
                Spacer(),
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: 54,
                  child: RaisedButton(
                    child: Text(
                      'حفظ',
                      style: TextStyle(color: Colors.white),
                    ),
                    color: mainColor,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8)),
                    onPressed: () {
                      //_saveForm();
                      Navigator.of(context).pop();
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
