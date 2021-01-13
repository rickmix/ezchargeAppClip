import 'package:ezcharge_app_clip/app/payment/payment_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:fluttertoast/fluttertoast.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('App Clip EzCharge'),
        elevation: 0.0,
      ),
      body: BuildBody(),
    );
  }

  // Widget _buildContent() {

  //   return Column(
  //     // crossAxisAlignment: CrossAxisAlignment.stretch,
  //     children: <Widget>[
  //       Expanded(
  //         flex: 4,
  //         child: Container(
  //           color: Colors.white,
  //           child: Image.asset('assets/images/laadpaal-yay.jpg',
  //               fit: BoxFit.cover),
  //         ),
  //       ),
  //       Expanded(
  //         flex: 1,
  //         child: Container(
  //           color: Colors.white,
  //           padding: EdgeInsets.all(15.0),
  //           child: Align(
  //             alignment: Alignment.center,
  //             child: Text(
  //               'Charge your car with EzCharge',
  //               textAlign: TextAlign.center,
  //               style: TextStyle(fontSize: 28),
  //             ),
  //           ),
  //         ),
  //       ),
  //       Expanded(
  //         flex: 1,
  //         child: Container(
  //           color: Colors.white,
  //           child: Align(
  //             alignment: Alignment.bottomCenter,
  //             child: Text(
  //               'Start charging and pay with Apple pay!',
  //               textAlign: TextAlign.center,
  //               style: TextStyle(fontSize: 14),
  //             ),
  //           ),
  //         ),
  //       ),
  //       Expanded(
  //         flex: 1,
  //         child: Container(
  //           color: Colors.white,
  //           child: Row(
  //             mainAxisAlignment: MainAxisAlignment.center,
  //             children: <Widget>[
  //               FlatButton(
  //                 onPressed: () => {
  //                   Fluttertoast.showToast(
  //                       msg: "Start session",
  //                       toastLength: Toast.LENGTH_LONG,
  //                       gravity: ToastGravity.CENTER,
  //                       timeInSecForIosWeb: 1,
  //                       backgroundColor: Colors.black,
  //                       textColor: Colors.white,
  //                       fontSize: 16.0)
  //                 },
  //                 color: Colors.black,
  //                 child: Row(
  //                   children: <Widget>[
  //                     Icon(Icons.battery_charging_full,
  //                         size: 50.0, color: Colors.white),
  //                     Text("Start", style: TextStyle(color: Colors.white))
  //                   ],
  //                 ),
  //               ),
  //             ],
  //           ),
  //         ),
  //       ),
  //     ],
  //   );
  //   return Container(
  //     color: Colors.white,
  //     child: Column(
  //       crossAxisAlignment: CrossAxisAlignment.stretch,
  //       children: <Widget>[
  //         Image(
  //           image: AssetImage('assets/images/Laadpaal-thuis-2-800x400.jpg'),
  //         ),
  //         SizedBox(height: 8.0),
  //         Text('Start charging your car',
  //             textAlign: TextAlign.center,
  //             style: TextStyle(
  //                 fontSize: 28.0,
  //                 color: Colors.black,
  //                 fontWeight: FontWeight.bold)),
  //         SizedBox(height: 8.0),
  //         FlatButton(
  //           onPressed: () => {},
  //           color: Colors.black,
  //           padding: EdgeInsets.all(10.0),
  //           child: Column(
  //             children: <Widget>[
  //               Icon(Icons.battery_charging_full, color: Colors.white),
  //               Text("Start", style: TextStyle(color: Colors.white))
  //             ],
  //           ),
  //         ),
  //       ],
  //     ),
  //   );
}

class BuildBody extends StatefulWidget {
  @override
  _BuildBodyState createState() => _BuildBodyState();
}

class _BuildBodyState extends State<BuildBody> {
  // void onClick() {
  //   Navigator.push(
  //       context, MaterialPageRoute(builder: (context) => PaymentPage()));
  // }

  String _data = "";

  _scan() async {
    await FlutterBarcodeScanner.scanBarcode(
            "#000000", "Cancel", true, ScanMode.BARCODE)
        .then((value) => setState(() => _data = value));

    Navigator.of(context).push(MaterialPageRoute(
      builder: (context) => PaymentPage(_data.split("/")[3]),
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      // crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Expanded(
          flex: 4,
          child: Container(
            color: Colors.white,
            child: Image.asset('assets/images/laadpaal-yay.jpg',
                fit: BoxFit.cover),
          ),
        ),
        Expanded(
          flex: 1,
          child: Container(
            color: Colors.white,
            padding: EdgeInsets.all(15.0),
            child: Align(
              alignment: Alignment.center,
              child: Text(
                'Charge your car with EzCharge',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 28),
              ),
            ),
          ),
        ),
        Expanded(
          flex: 1,
          child: Container(
            color: Colors.white,
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Text(
                'Start charging and pay with Apple pay!',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 14),
              ),
            ),
          ),
        ),
        Expanded(
          flex: 2,
          child: Container(
            color: Colors.white,
            child: Row(
              children: <Widget>[
                Expanded(flex: 1, child: Container(color: Colors.white)),
                Expanded(
                  flex: 3,
                  child: FlatButton(
                    padding: EdgeInsets.fromLTRB(5, 5, 5, 5),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18.0),
                      side: BorderSide(color: Colors.black),
                    ),
                    onPressed: this._scan,
                    color: Colors.black,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Icon(Icons.battery_charging_full,
                            size: 50.0, color: Colors.white),
                        Text("Start charging",
                            style: TextStyle(color: Colors.white, fontSize: 18))
                      ],
                    ),
                  ),
                ),
                Expanded(flex: 1, child: Container(color: Colors.white)),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

@override
Widget build(BuildContext context) {
  return Container();
}
