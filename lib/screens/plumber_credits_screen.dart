import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'file:///F:/android/work/golf-project-flutter/lib/models/credit.dart';
import 'package:golf_app/providers/plumbers.dart';
import 'package:golf_app/utils/constants.dart';
import 'package:provider/provider.dart';

class PlumberCreditsScreen extends StatefulWidget {
  static const ROUTE_NAME = '/plumberCreditsScreen';

  @override
  _PlumberCreditsScreenState createState() => _PlumberCreditsScreenState();
}

class _PlumberCreditsScreenState extends State<PlumberCreditsScreen> {
  @override
  void initState() {
    super.initState();
    getCredits();
  }

  void getCredits() async {
    await Provider.of<Plumbers>(context, listen: false).getCredits();
  }

  @override
  Widget build(BuildContext context) {
    final int args = ModalRoute.of(context).settings.arguments;
    return Scaffold(
      appBar: AppBar(
        title: Text('الرصيد'),
        backgroundColor: mainColor,
      ),
      body: FutureBuilder(
        future: Provider.of<Plumbers>(context, listen: false).getCredits(),
        builder: (context, snapshot) => snapshot.connectionState ==
                ConnectionState.waiting
            ? Center(
                child: SpinKitDoubleBounce(
                  color: Colors.white,
                  size: 50.0,
                ),
              )
            : Consumer<Plumbers>(
                builder: (context, plumbersData, ch) => Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  child: ListView.builder(
                    itemCount: plumbersData.credits[args].length,
                    itemBuilder: (context, i) {
                      return Card(
                        child: Column(
                          children: [
                            Text(
                              plumbersData.credits[args][i].title,
                              style: TextStyle(
                                fontSize: 24,
                              ),
                            ),
                            Text(
                              plumbersData.credits[args][i].value,
                              style: TextStyle(
                                fontSize: 24,
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
              ),
      ),
    );
  }
}
