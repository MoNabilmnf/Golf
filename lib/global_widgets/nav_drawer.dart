import 'package:flutter/material.dart';
import 'package:golf_app/providers/auth.dart';
import 'package:golf_app/screens/new_complaint_screen.dart';
import 'package:provider/provider.dart';

class NavigationDrawer extends StatelessWidget {
  final Function selectedIndex;

  NavigationDrawer(this.selectedIndex);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SafeArea(
        child: ListView(
          children: [
            DrawerHeader(
              child: Image.asset('assets/images/logo.png'),
            ),
            ListTile(
              title: Text('الصفحة الرئيسية'),
              onTap: () {
                selectedIndex(0);
              },
            ),
            ListTile(
              title: Text('قائمة التجار'),
              onTap: () {
                selectedIndex(1);
              },
            ),
            // ListTile(
            //   title: Text('الزيارات'),
            //   onTap: () {
            //     selectedIndex(2);
            //   },
            // ),
            // ListTile(
            //   title: Text('الطلبيات'),
            //   onTap: () {
            //     selectedIndex(3);
            //   },
            // ),
            ListTile(
              title: Text('عروض و مسابقات'),
              onTap: () {
                selectedIndex(2);
              },
            ),
            ListTile(
              title: Text('قائمة الأسعار'),
              onTap: () {
                selectedIndex(3);
              },
            ),
            // ListTile(
            //   title: Text('المهمات'),
            //   onTap: () {
            //     selectedIndex(6);
            //   },
            // ),
            ListTile(
              title: Text('قائمة الموزعين'),
              onTap: () {
                selectedIndex(4);
              },
            ),
            ListTile(
              title: Text('قائمة مديرين المبيعات'),
              onTap: () {
                selectedIndex(5);
              },
            ),
            ListTile(
              title: Text('قائمة مديرين خدمة العملاء'),
              onTap: () {
                selectedIndex(6);
              },
            ),
            ListTile(
              title: Text('قائمة مناديب خدمة العملاء'),
              onTap: () {
                selectedIndex(7);
              },
            ),
            ListTile(
              title: Text('قائمة مناديب المبيعات'),
              onTap: () {
                selectedIndex(8);
              },
            ),
            ListTile(
              title: Text('المعاينة'),
              onTap: () {
                selectedIndex(9);
              },
            ),
            ListTile(
              title: Text('الفنيين'),
              onTap: () {
                selectedIndex(10);
              },
            ),
            ListTile(
              title: Text('الشكاوى و الإقتراحات'),
              onTap: () {
                Navigator.of(context).pushNamed(NewComplaintScreen.ROUTE_NAME);
              },
            ),
            ListTile(
              title: Text('تسجيل خروج'),
              onTap: () {
                Navigator.of(context).pop();
                Provider.of<Auth>(context, listen: false).logoutUser();
              },
            ),
          ],
        ),
      ),
    );
  }
}
