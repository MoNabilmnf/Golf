import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'Global.dart';
import 'file:///F:/android/work/golf-project-flutter/lib/models/order.dart';
import 'package:golf_app/providers/auth.dart';
import 'package:golf_app/providers/bills.dart';
import 'package:golf_app/providers/cs_managers.dart';
import 'package:golf_app/providers/customer_services_agents.dart';
import 'package:golf_app/providers/distributors.dart';
import 'package:golf_app/providers/gifts.dart';
import 'package:golf_app/providers/orders.dart';
import 'package:golf_app/providers/plumbers.dart';
import 'package:golf_app/providers/price_items.dart';
import 'package:golf_app/providers/reports.dart';
import 'package:golf_app/providers/sales_agents.dart';
import 'package:golf_app/providers/sales_managers.dart';
import 'package:golf_app/providers/merchants.dart';
import 'package:golf_app/providers/offers.dart';
import 'package:golf_app/providers/price_images.dart';
import 'package:golf_app/providers/visits.dart';
import 'package:golf_app/screens/bill_print_preview.dart';
import 'package:golf_app/screens/new_bill_categories_screen.dart';
import 'package:golf_app/screens/new_bill_screen.dart';
import 'package:golf_app/screens/home_screen.dart';
import 'package:golf_app/screens/home_screen_body/serials_screen.dart';
import 'package:golf_app/screens/login_screen.dart';
import 'package:golf_app/screens/merchant_loc_map.dart';
import 'package:golf_app/screens/new_complaint_screen.dart';
import 'package:golf_app/screens/new_distibutor_screen.dart';
import 'package:golf_app/screens/new_gift_screen.dart';
import 'package:golf_app/screens/new_merchant_screen.dart';
import 'package:golf_app/screens/new_order_screen.dart';
import 'package:golf_app/screens/new_report_screen.dart';
import 'package:golf_app/screens/new_serial_screen.dart';
import 'package:golf_app/screens/new_visit_screen.dart';
import 'package:golf_app/screens/plumber_bills_screen.dart';
import 'package:golf_app/screens/plumber_credits_screen.dart';
import 'package:golf_app/screens/price_images_screen.dart';
import 'package:location/location.dart';
import 'package:provider/provider.dart';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() {
    Addinter(Lat,Long,String id) async {
    var body = {

        "lon": "$Long",
        "lat": "$Lat",
        "userId": "$id"

    };
    if(id.isNotEmpty){
      http.Response response = await http.post('https://elgolfapp.com/api/sendGPSLocation',body: body,headers: { "Accept":"application/json"});
      print(response.body.toString());
      var responsebody = json.decode(response.body);
      print(responsebody['message'].toString());
      print(responsebody['data'].toString());
    }

    // if(responsebody['status'] == 200){
    //   return 'success';
    // }else{
    //   return 'error';
    // }
  }
    getLocationNow() async {
    Location location = new Location();

    bool _serviceEnabled;
    PermissionStatus _permissionGranted;
    LocationData _locationData;
    _locationData = await location.getLocation();
    _serviceEnabled = await location.serviceEnabled();
    if (!_serviceEnabled) {
      _serviceEnabled = await location.requestService();
      if (!_serviceEnabled) {
        //return;
      }else{
        Addinter('${_locationData.latitude}','${_locationData.longitude}',CheckUserId);
      }
    }else{
      Addinter('${_locationData.latitude}','${_locationData.longitude}',CheckUserId);
    }


  }

    const oneSec = const Duration(seconds:60);
    new Timer.periodic(oneSec, (Timer t) => getLocationNow());
    runApp(GolfApp());
}

class GolfApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => Auth(),
        ),
        ChangeNotifierProxyProvider<Auth, Merchants>(
          update: (context, authData, prevData) => Merchants(authData.id),
          create: null,
        ),
        ChangeNotifierProxyProvider<Auth, Distributors>(
          update: (context, authData, prevData) => Distributors(authData.id),
          create: null,
        ),
        ChangeNotifierProxyProvider<Auth, Reports>(
          update: (context, authData, prevData) => Reports(authData.id),
          create: null,
        ),
        ChangeNotifierProxyProvider<Auth, Gifts>(
          update: (context, authData, prevData) => Gifts(authData.id),
          create: null,
        ),
        ChangeNotifierProxyProvider<Auth, Orders>(
          update: (context, authData, prevData) => Orders(authData.id),
          create: null,
        ),
        ChangeNotifierProxyProvider<Auth, Visits>(
          update: (context, authData, prevData) => Visits(authData.id),
          create: null,
        ),
        ChangeNotifierProxyProvider<Auth, Plumbers>(
          update: (context, authData, prevData) => Plumbers(authData.id),
          create: null,
        ),
        ChangeNotifierProvider(
          create: (context) => PriceItems(),
        ),
        ChangeNotifierProvider(
          create: (context) => Offers(),
        ),
        ChangeNotifierProvider(
          create: (context) => PriceImages(),
        ),
        ChangeNotifierProvider(
          create: (context) => SalesManagers(),
        ),
        ChangeNotifierProvider(
          create: (context) => CSManagers(),
        ),
        ChangeNotifierProvider(
          create: (context) => CustomerServicesAgents(),
        ),
        ChangeNotifierProvider(
          create: (context) => SalesAgents(),
        ),
        ChangeNotifierProvider(
          create: (context) => Bills(),
        ),
      ],
      child: Consumer<Auth>(
        builder: (context, authData, ch) => MaterialApp(
          debugShowCheckedModeBanner: false,
          localizationsDelegates: [
            // ... app-specific localization delegate[s] here
            //AppLocalizations.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          supportedLocales: [
            const Locale('en', ''), // English, no country code
            const Locale('ar', ''), // Arabic, no country code
            // ... other locales the app supports
          ],
          locale: const Locale('ar', ''),
          title: 'Golf App',
          theme: ThemeData.dark(),
          home: authData.isAuth() ? HomeScreen() : LoginScreen(),
          routes: {
            LoginScreen.ROUTE_NAME: (context) => LoginScreen(),
            HomeScreen.ROUTE_NAME: (context) => HomeScreen(),
            NewMerchantScreen.ROUTE_NAME: (context) => NewMerchantScreen(),
            NewComplaintScreen.ROUTE_NAME: (context) => NewComplaintScreen(),
            NewGiftScreen.ROUTE_NAME: (context) => NewGiftScreen(),
            NewOrdersScreen.ROUTE_NAME: (context) => NewOrdersScreen(),
            NewVisitScreen.ROUTE_NAME: (context) => NewVisitScreen(),
            NewSerialScreen.ROUTE_NAME: (context) => NewSerialScreen(),
            SerialsScreen.ROUTE_NAME: (context) => SerialsScreen(),
            PriceImagesScreen.ROUTE_NAME: (context) => PriceImagesScreen(),
            NewDistributorScreen.ROUTE_NAME: (context) =>
                NewDistributorScreen(),
            NewReportScreen.ROUTE_NAME: (context) => NewReportScreen(),
            NewBillScreen.ROUTE_NAME: (context) => NewBillScreen(),
            MerchantLocMap.ROUTE_NAME: (context) => MerchantLocMap(),
            NewBillCategoriesScreen.ROUTE_NAME: (context) =>
                NewBillCategoriesScreen(),
            BillPrintPreview.ROUTE_NAME: (context) => BillPrintPreview(),
            PlumberCreditsScreen.ROUTE_NAME: (context) =>
                PlumberCreditsScreen(),
            PlumberBillsScreen.ROUTE_NAME: (context) => PlumberBillsScreen(),
          },
        ),
      ),
    );
  }
}
