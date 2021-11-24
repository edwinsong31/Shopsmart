import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:shopsmart/Pages/BarcodeDetailPage.dart';
import 'package:shopsmart/Pages/TakePhotoPage.dart';

class SplashPage extends StatefulWidget {
  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {

  void scanBarCode() async{
    String barcodeScanRes = await FlutterBarcodeScanner.scanBarcode(
        '#ff6666',
        'Cancel',
        true,
        ScanMode.BARCODE);

    if (barcodeScanRes != '-1'){
      Navigator.push(context, MaterialPageRoute(builder: (context) => BarcodeDetailPage(barcodeScanRes)));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(height: 200),
          Text('Shopsmart', style: TextStyle(fontSize: 30)),
          Spacer(),
          Container(
            width: double.infinity, height: 48,
            margin: EdgeInsets.only(left: 50, right: 50),
            child: ElevatedButton(onPressed: () {
              scanBarCode();
            }, child: Text('Scan barcode', style: TextStyle(fontSize: 18),)),
          ),
          Container(
            width: double.infinity, height: 48,
            margin: EdgeInsets.only(left: 50, right: 50, top: 50, bottom: 100),
            child: ElevatedButton(onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => TakePhotoPage()));
            }, child: Text('Take photo',style: TextStyle(fontSize: 18),)),
          )
        ],
      ),
    );
  }
}