import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:geolocator/geolocator.dart';
import 'file:///F:/android/work/golf-project-flutter/lib/models/merchant.dart';
import 'package:golf_app/providers/merchants.dart';
import 'package:golf_app/screens/merchant_loc_map.dart';
import 'package:golf_app/screens/new_gift_screen.dart';
import 'package:golf_app/screens/new_order_screen.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

import '../new_visit_screen.dart';

class MerchantsPage extends StatefulWidget {
  @override
  _MerchantsPageState createState() => _MerchantsPageState();
}

class _MerchantsPageState extends State<MerchantsPage> {
  TextEditingController _searchController = TextEditingController();
  List<Merchant> _merchants = [];
  List<Merchant> _filteredMerchants = [];

  Future<void> _makePhoneCall(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      print('Could not launch $url');
    }
  }

  @override
  void initState() {
    super.initState();
    _getLastKnownPosition();
  }

  Future<void> _getLastKnownPosition() async {
    // Position position = await Geolocator.getLastKnownPosition();
    // if (position.longitude != null && position.latitude != null) {
    //   print(
    //       'Last know position: ${position.longitude} and ${position.latitude}');
    // }
  }

  void onSearchTextChanged(String searchText) {
    _filteredMerchants.clear();
    if (searchText.trim().isEmpty) {
      setState(() {});
      return;
    }
    _merchants.forEach((merchant) {
      if (merchant.shopName.contains(searchText.trim()) ||
          merchant.respName.contains(searchText.trim()) ||
          merchant.code.contains(searchText.trim()) ||
          merchant.telephoneNumber.contains(searchText.trim())) {
        _filteredMerchants.add(merchant);
      }
    });
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextField(
            decoration: InputDecoration(
              hintText: 'بحث',
              suffixIcon: _searchController.text.isEmpty
                  ? Icon(Icons.search)
                  : IconButton(
                      icon: Icon(Icons.close),
                      onPressed: () {
                        setState(() {
                          _filteredMerchants.clear();
                          _searchController.text = '';
                        });
                      },
                    ),
            ),
            onChanged: onSearchTextChanged,
            controller: _searchController,
          ),
        ),
        Expanded(
          child: FutureBuilder(
            future:
                Provider.of<Merchants>(context, listen: false).getMerchants(),
            builder: (context, snapshot) => snapshot.connectionState ==
                    ConnectionState.waiting
                ? Center(
                    child: SpinKitDoubleBounce(
                      color: Colors.white,
                      size: 50.0,
                    ),
                  )
                : Consumer<Merchants>(
                    builder: (context, merchantsData, ch) {
                      _merchants = merchantsData.merchants;
                      if (_filteredMerchants.isEmpty) {
                        if (_searchController.text.isNotEmpty) {
                          return Center(
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.warning,
                                  color: Colors.yellowAccent,
                                ),
                                Text('لم يتم العثور على شئ.'),
                              ],
                            ),
                          );
                        }
                        return ListView.builder(
                          itemCount: merchantsData.merchants.length,
                          itemBuilder: (context, i) {
                            return Padding(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 4, horizontal: 16),
                              child: Card(
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                merchantsData
                                                    .merchants[i].shopName,
                                                style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 24,
                                                ),
                                              ),
                                              Text(
                                                merchantsData
                                                    .merchants[i].respName,
                                                style: TextStyle(
                                                  fontSize: 20,
                                                ),
                                              ),
                                            ],
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Text(
                                              merchantsData.merchants[i].code,
                                              style: TextStyle(
                                                fontSize: 20,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: [
                                          Column(
                                            children: [
                                              IconButton(
                                                icon: Icon(
                                                  Icons.location_on,
                                                  color: Colors.red,
                                                  size: 32,
                                                ),
                                                onPressed: () {
                                                  Navigator.of(context)
                                                      .pushNamed(
                                                    MerchantLocMap.ROUTE_NAME,
                                                    arguments: {
                                                      'id': merchantsData
                                                          .merchants[i].id,
                                                      'title': merchantsData
                                                          .merchants[i]
                                                          .shopName,
                                                      'lat': merchantsData
                                                          .merchants[i].lat,
                                                      'lon': merchantsData
                                                          .merchants[i].lon,
                                                    },
                                                  );
                                                },
                                              ),
                                              Text('عنوان'),
                                            ],
                                          ),
                                          Column(
                                            children: [
                                              IconButton(
                                                icon: Icon(
                                                  Icons.call,
                                                  color: Colors.green,
                                                  size: 32,
                                                ),
                                                onPressed: () => setState(() {
                                                  _makePhoneCall(
                                                      'tel:${merchantsData.merchants[i].telephoneNumber}');
                                                }),
                                              ),
                                              Text('إتصال'),
                                            ],
                                          ),
                                          Column(
                                            children: [
                                              IconButton(
                                                icon: Icon(
                                                  Icons.payments,
                                                  color: Colors.blue,
                                                  size: 32,
                                                ),
                                                onPressed: () {
                                                  Navigator.of(context)
                                                      .pushNamed(
                                                          NewOrdersScreen
                                                              .ROUTE_NAME,
                                                          arguments: {
                                                        'id': merchantsData
                                                            .merchants[i].id,
                                                        'type': 1,
                                                      });
                                                },
                                              ),
                                              Text('طلبية'),
                                            ],
                                          ),
                                          Column(
                                            children: [
                                              IconButton(
                                                icon: Icon(
                                                  Icons.wallet_giftcard,
                                                  color: Colors.yellow[700],
                                                  size: 32,
                                                ),
                                                onPressed: () {
                                                  Navigator.of(context)
                                                      .pushNamed(
                                                          NewGiftScreen
                                                              .ROUTE_NAME,
                                                          arguments: {
                                                        'id': merchantsData
                                                            .merchants[i].id,
                                                        'type': 1,
                                                      });
                                                },
                                              ),
                                              Text('هدية'),
                                            ],
                                          ),
                                          Column(
                                            children: [
                                              IconButton(
                                                icon: Icon(
                                                  Icons.tour,
                                                  color: Colors.brown,
                                                  size: 32,
                                                ),
                                                onPressed: () {
                                                  Navigator.of(context)
                                                      .pushNamed(
                                                          NewVisitScreen
                                                              .ROUTE_NAME,
                                                          arguments: {
                                                        'id': merchantsData
                                                            .merchants[i].id,
                                                        'type': 1,
                                                      });
                                                },
                                              ),
                                              Text('زيارة'),
                                            ],
                                          ),
                                          // Column(
                                          //   children: [
                                          //     IconButton(
                                          //       icon: Icon(
                                          //         Icons.qr_code,
                                          //         color: Colors.red,
                                          //         size: 32,
                                          //       ),
                                          //       onPressed: () {
                                          //         Navigator.of(context)
                                          //             .pushNamed(SerialsScreen.ROUTE_NAME);
                                          //       },
                                          //     ),
                                          //     Text('سيريال'),
                                          //   ],
                                          // ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            );
                          },
                        );
                      } else {
                        return ListView.builder(
                          itemCount: _filteredMerchants.length,
                          itemBuilder: (context, i) {
                            return Padding(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 4, horizontal: 16),
                              child: Card(
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                _filteredMerchants[i].shopName,
                                                style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 24,
                                                ),
                                              ),
                                              Text(
                                                _filteredMerchants[i].respName,
                                                style: TextStyle(
                                                  fontSize: 20,
                                                ),
                                              ),
                                            ],
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Text(
                                              _filteredMerchants[i].code,
                                              style: TextStyle(
                                                fontSize: 20,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: [
                                          Column(
                                            children: [
                                              IconButton(
                                                icon: Icon(
                                                  Icons.location_on,
                                                  color: Colors.red,
                                                  size: 32,
                                                ),
                                                onPressed: () {
                                                  Navigator.of(context)
                                                      .pushNamed(
                                                    MerchantLocMap.ROUTE_NAME,
                                                    arguments: {
                                                      'id':
                                                          _filteredMerchants[i]
                                                              .id,
                                                      'title':
                                                          _filteredMerchants[i]
                                                              .shopName,
                                                      'lat':
                                                          _filteredMerchants[i]
                                                              .lat,
                                                      'lon':
                                                          _filteredMerchants[i]
                                                              .lon,
                                                    },
                                                  );
                                                },
                                              ),
                                              Text('عنوان'),
                                            ],
                                          ),
                                          Column(
                                            children: [
                                              IconButton(
                                                icon: Icon(
                                                  Icons.call,
                                                  color: Colors.green,
                                                  size: 32,
                                                ),
                                                onPressed: () => setState(() {
                                                  _makePhoneCall(
                                                      'tel:${_filteredMerchants[i].telephoneNumber}');
                                                }),
                                              ),
                                              Text('إتصال'),
                                            ],
                                          ),
                                          Column(
                                            children: [
                                              IconButton(
                                                icon: Icon(
                                                  Icons.payments,
                                                  color: Colors.blue,
                                                  size: 32,
                                                ),
                                                onPressed: () {
                                                  Navigator.of(context)
                                                      .pushNamed(
                                                      NewOrdersScreen
                                                          .ROUTE_NAME,
                                                      arguments: {
                                                        'id':
                                                        _filteredMerchants[
                                                        i]
                                                            .id,
                                                        'type': 1,
                                                      });
                                                },
                                              ),
                                              Text('طلبية'),
                                            ],
                                          ),
                                          Column(
                                            children: [
                                              IconButton(
                                                icon: Icon(
                                                  Icons.wallet_giftcard,
                                                  color: Colors.yellow[700],
                                                  size: 32,
                                                ),
                                                onPressed: () {
                                                  Navigator.of(context)
                                                      .pushNamed(
                                                          NewGiftScreen
                                                              .ROUTE_NAME,
                                                          arguments: {
                                                        'id':
                                                            _filteredMerchants[
                                                                    i]
                                                                .id,
                                                        'type': 1,
                                                      });
                                                },
                                              ),
                                              Text('هدية'),
                                            ],
                                          ),
                                          Column(
                                            children: [
                                              IconButton(
                                                icon: Icon(
                                                  Icons.tour,
                                                  color: Colors.brown,
                                                  size: 32,
                                                ),
                                                onPressed: () {
                                                  Navigator.of(context)
                                                      .pushNamed(
                                                      NewVisitScreen
                                                          .ROUTE_NAME,
                                                      arguments: {
                                                        'id':
                                                        _filteredMerchants[
                                                        i]
                                                            .id,
                                                        'type': 1,
                                                      });
                                                },
                                              ),
                                              Text('زيارة'),
                                            ],
                                          ),
                                          // Column(
                                          //   children: [
                                          //     IconButton(
                                          //       icon: Icon(
                                          //         Icons.qr_code,
                                          //         color: Colors.red,
                                          //         size: 32,
                                          //       ),
                                          //       onPressed: () {
                                          //         Navigator.of(context)
                                          //             .pushNamed(SerialsScreen.ROUTE_NAME);
                                          //       },
                                          //     ),
                                          //     Text('سيريال'),
                                          //   ],
                                          // ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            );
                          },
                        );
                      }
                    },
                  ),
          ),
        ),
      ],
    );
  }
}
