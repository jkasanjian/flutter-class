import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'coin_data.dart';
import 'coin_data.dart';
import 'network.dart';
import 'dart:io' show Platform;

const BASE_URL = 'https://rest.coinapi.io/v1/exchangerate';
const API_KEY = '35FC80C5-1D66-4250-9DF7-E5F0A963CBD2';

class PriceScreen extends StatefulWidget {
  @override
  _PriceScreenState createState() => _PriceScreenState();
}

class _PriceScreenState extends State<PriceScreen> {
  String selectedCur = 'USD';
  double btc;

  @override
  void initState() {
    super.initState();
  }

  void updateUI(String val) async {
    dynamic coinData = await getValues(val);
    setState(
      () {
        if (coinData == null) {
          btc = 0.00;
          selectedCur = 'ERROR';
        }
        selectedCur = val;
        btc = coinData['rate'];
      },
    );
  }

  Future<dynamic> getValues(String curr) async {
    NetworkHelper networkHelper =
        NetworkHelper('$BASE_URL/BTC/$curr?apikey=$API_KEY');
    var data = await networkHelper.getData();
    return data;
  }

  DropdownButton<String> androidDropdown() {
    List<DropdownMenuItem<String>> dropItems = [];
    for (String s in currenciesList) {
      dropItems.add(DropdownMenuItem<String>(child: Text(s), value: s));
    }
    return DropdownButton<String>(
      value: selectedCur,
      items: dropItems,
      onChanged: (value) {
        setState(
          () {
            selectedCur = value;
            updateUI(value);
          },
        );
      },
    );
  }

  CupertinoPicker iOSPicker() {
    List<Text> pickerItems = [];
    for (String s in currenciesList) {
      pickerItems.add(Text(
        s,
        style: TextStyle(color: Colors.white),
      ));
    }
    return CupertinoPicker(
      backgroundColor: Colors.lightBlue,
      itemExtent: 32.0,
      onSelectedItemChanged: (selectedIndex) {
        updateUI(currenciesList[selectedIndex]);
      },
      children: pickerItems,
    );
  }

  String getText() {
    if (btc != null) {
      return '1 BTC = ${btc.toStringAsFixed(2)} $selectedCur';
    } else {
      return '1 BTC = ? $selectedCur';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('💱 Coin Ticker'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.fromLTRB(18.0, 18.0, 18.0, 0),
            child: Card(
              color: Colors.lightBlueAccent,
              elevation: 5.0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 28.0),
                child: Text(
                  getText(),
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 20.0,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
          Container(
            height: 150.0,
            alignment: Alignment.center,
            padding: EdgeInsets.only(bottom: 30.0),
            color: Colors.lightBlue,
            child: Platform.isIOS ? iOSPicker() : androidDropdown(),
          ),
        ],
      ),
    );
  }
}
