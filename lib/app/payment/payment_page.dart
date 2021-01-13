import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_brand_icons/flutter_brand_icons.dart';

class PaymentPage extends StatefulWidget {
  final String poleId;
  PaymentPage(this.poleId);

  @override
  _PaymentPageState createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pay and charge!'),
        elevation: 0.0,
      ),
      body: BodyPage(widget.poleId),
    );
  }
}

class BodyPage extends StatefulWidget {
  final String chargePole;
  BodyPage(this.chargePole);

  @override
  _BodyPageState createState() => _BodyPageState();
}

class _BodyPageState extends State<BodyPage> {
  String charingTime;
  bool isButtonDisabled = true;
  TextEditingController controller = new TextEditingController();

  @override
  void dispose() {
    // Clean up the controller when the widget is removed from the
    // widget tree.
    controller.dispose();
    super.dispose();
  }

  void click() {
    this.charingTime = controller.text;
    //Navigator.push(context,
    //MaterialPageRoute(builder: (context) => MyHomePage(this.name)));
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Expanded(
          flex: 1,
          child: Container(
            color: Colors.white,
            child: Align(
              alignment: Alignment.center,
              child: Padding(
                padding: EdgeInsets.fromLTRB(20, 20, 20, 20),
                child: Text(
                  "Charging pole id: " + widget.chargePole,
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ),
        ),
        Expanded(
          flex: 3,
          child: Container(
            color: Colors.white,
            child: Align(
              alignment: Alignment.center,
              child: Padding(
                padding: EdgeInsets.all(10),
                child: TextField(
                  controller: this.controller,
                  onChanged: (String value) async {
                    if (value.isEmpty) {
                      setState(() {
                        isButtonDisabled = true;
                      });
                    } else {
                      setState(() {
                        this.charingTime = controller.text;
                        isButtonDisabled = false;
                      });
                    }
                  },
                  keyboardType: TextInputType.number,
                  inputFormatters: <TextInputFormatter>[
                    FilteringTextInputFormatter.digitsOnly
                  ],
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.schedule),
                    labelText: "Enter charge minutes: ",
                    border: OutlineInputBorder(
                        borderSide: BorderSide(width: 5, color: Colors.black)),
                  ),
                ),
              ),
            ),
          ),
        ),
        Expanded(
          flex: 3,
          child: Container(
            color: Colors.white,
            child: Row(
              children: <Widget>[
                Expanded(flex: 1, child: Container(color: Colors.white)),
                (isButtonDisabled)
                    ? Expanded(
                        flex: 3,
                        child: Text(
                          "Enter minutes to start charging",
                          textAlign: TextAlign.center,
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      )
                    : Expanded(
                        flex: 3,
                        child: FlatButton(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(18.0),
                              side: BorderSide(color: Colors.black)),
                          onPressed: () =>
                              this._showPayDialog(this.charingTime),
                          color: Colors.black,
                          child: Icon(BrandIcons.applepay,
                              size: 50.0, color: Colors.white),
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

  Future<void> _showPayDialog(String totalChargingTime) async {
    String calculateCharingCosts() {
      double charingTime = double.parse(totalChargingTime) * 0.15;
      String totalText = charingTime.toStringAsFixed(2);

      return totalText;
    }

    return showDialog<void>(
        context: context,
        barrierDismissible: false, // user must tap button!
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text("Start your session."),
            content: SingleChildScrollView(
              child: ListBody(
                children: <Widget>[
                  Text('Do you wish to start your charging session and pay \$' +
                      calculateCharingCosts() +
                      '?'),
                ],
              ),
            ),
            actions: <Widget>[
              TextButton(
                child: Text('Cancel'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
              TextButton(
                child: Text('Pay'),
                onPressed: () async {
                  //docRef = await startSession();
                  //globals.chargingStation = chargingStationId.toString();
                  //print(docRef);
                  // Navigator.of(context).push(MaterialPageRoute
                  //   (builder: (context) => Charging(docRef : docRef),
                  // ));
                },
              ),
            ],
          );
        }
        // },
        );
  }
}
