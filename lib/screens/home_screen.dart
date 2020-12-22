import 'package:flutter/material.dart';
import 'package:golf_app/Global.dart';
import 'package:golf_app/global_widgets/nav_drawer.dart';
import 'package:golf_app/screens/home_screen_body/bills_menu_screen.dart';
import 'package:golf_app/screens/home_screen_body/cs_managers_page.dart';
import 'package:golf_app/screens/home_screen_body/customer_services_agents_page.dart';
import 'package:golf_app/screens/home_screen_body/plumbers_page.dart';
import 'package:golf_app/screens/home_screen_body/sales_agents_page.dart';
import 'package:golf_app/screens/new_bill_screen.dart';
import 'package:golf_app/screens/home_screen_body/main_page.dart';
import 'package:golf_app/screens/home_screen_body/sales_managers_page.dart';
import 'package:golf_app/screens/home_screen_body/merchants_page.dart';
import 'package:golf_app/screens/home_screen_body/offers_page.dart';
import 'package:golf_app/screens/home_screen_body/prices_page.dart';
import 'package:golf_app/screens/new_distibutor_screen.dart';
import 'package:golf_app/screens/new_merchant_screen.dart';
import 'package:golf_app/utils/constants.dart';

import 'home_screen_body/distibutors_page.dart';

class HomeScreen extends StatefulWidget {
  static const ROUTE_NAME = '/homeRoute';

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedHomeIndex = 0;

  void _selectedHomePage(int selectedIndex) {
    setState(() {
      Navigator.pop(context);
      _selectedHomeIndex = selectedIndex;
    });
  }

  List<Map<String, Object>> _homePages;

  @override
  void initState() {
    super.initState();
    firebaseCloudMessagingListeners();
    _homePages = [
      {
        'title': 'الصفحة الرئيسية',
        'body': MainPage(),
        'floatingActionButton': null,
      },
      {
        'title': 'قائمة التجار',
        'body': MerchantsPage(),
        'floatingActionButton': FloatingActionButton.extended(
          label: Text(
            'إضافة تاجر',
            style: TextStyle(color: Colors.white),
          ),
          icon: Icon(
            Icons.add,
            color: Colors.white,
          ),
          backgroundColor: mainColor,
          onPressed: () {
            Navigator.of(context).pushNamed(NewMerchantScreen.ROUTE_NAME);
          },
        ),
      },
      // {
      //   'title': 'الزيارات',
      //   'body': VisitsPage(),
      //   'floatingActionButton': null,
      // },
      // {
      //   'title': 'الطلبيات',
      //   'body': OrdersPage(),
      //   'floatingActionButton': null,
      // },
      {
        'title': 'عروض و مسابقات',
        'body': OffersPage(),
        'floatingActionButton': null,
      },
      {
        'title': 'قائمة الأسعار',
        'body': PricesPage(),
        'floatingActionButton': null,
      },
      // {
      //   'title': 'المهمات',
      //   'body': TasksPage(),
      //   'floatingActionButton': null,
      // },
      // {
      //   'title': 'الشكاوى و الإقتراحات',
      //   'body': ComplaintsPage(),
      //   'floatingActionButton': null,
      // },
      {
        'title': 'قائمة الموزعين',
        'body': DistributorsPage(),
        'floatingActionButton': FloatingActionButton.extended(
          label: Text(
            'إضافة موزع',
            style: TextStyle(color: Colors.white),
          ),
          icon: Icon(
            Icons.add,
            color: Colors.white,
          ),
          backgroundColor: mainColor,
          onPressed: () {
            Navigator.of(context).pushNamed(NewDistributorScreen.ROUTE_NAME);
          },
        ),
      },
      {
        'title': 'قائمة مديرين المبيعات',
        'body': SalesManagersPage(),
        'floatingActionButton': null,
      },
      {
        'title': 'قائمة مديرين خدمة العملاء',
        'body': CSManagersPage(),
        'floatingActionButton': null,
      },
      {
        'title': 'قائمة مناديب خدمة العملاء',
        'body': CustomerServicesAgentsPage(),
        'floatingActionButton': null,
      },
      {
        'title': 'قائمة مناديب المبيعات',
        'body': SalesAgentsPage(),
        'floatingActionButton': null,
      },
      {
        'title': 'المعاينة',
        'body': BillsMenuScreen(),
        'floatingActionButton': FloatingActionButton.extended(
          label: Text('إضافة معاينة'),
          icon: Icon(
            Icons.add,
            color: Colors.white,
          ),
          backgroundColor: mainColor,
          onPressed: () {
            Navigator.of(context).pushNamed(NewBillScreen.ROUTE_NAME);
          },
        ),
      },
      {
        'title': 'الفنيين',
        'body': PlumbersPage(),
        'floatingActionButton': null,
      },
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: NavigationDrawer(_selectedHomePage),
      appBar: AppBar(
        title: Text(_homePages[_selectedHomeIndex]['title']),
        backgroundColor: mainColor,
      ),
      body: _homePages[_selectedHomeIndex]['body'],
      floatingActionButton: _homePages[_selectedHomeIndex]
          ['floatingActionButton'],
    );
  }
}
