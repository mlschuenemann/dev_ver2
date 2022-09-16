import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:dev_ver2/screens/package_scan_page.dart';
import 'package:dev_ver2/components/cart_button.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dev_ver2/screens/payment_test.dart';
import 'package:dev_ver2/screens/braintree_test.dart';
import 'package:mobile_scanner/mobile_scanner.dart';

class GroceryScanPage extends StatefulWidget {
  const GroceryScanPage({Key? key}) : super(key: key);
  static const String id = 'GroceryScanPage';

  @override
  State<GroceryScanPage> createState() => _GroceryScanPageState();
}

class _GroceryScanPageState extends State<GroceryScanPage> {
  final _firestore = FirebaseFirestore.instance;

  void getID() async {
    try {
      final docRef =
          await _firestore.collection("groceries").doc("$textFieldValue");
      docRef.get().then(
        (DocumentSnapshot doc) {
          final data = doc.data() as Map<String, dynamic>;
          print(data);

          if (data.isNotEmpty) {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => PackageScanPage(textFieldValue),
                settings: RouteSettings(
                  arguments: textFieldValue,
                ),
              ),
            );
          }
        },
        onError: (e) {
          print('error');
        },
      );
    } catch (e) {
      print('error');
    }
  } //page_switcher

  var textFieldValue;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        top: true,
        child: Container(
          padding: EdgeInsets.only(left: 30, right: 30, top: 30, bottom: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Home',
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey.shade900,
                    ),
                  ),
                  CartButton(
                    buttonIcon: Icon(Icons.shopping_cart),
                  ),
                ],
              ),
              Text(
                'Lebensmittel scannen',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.normal,
                  color: Colors.grey.shade900,
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Expanded(
                child: MobileScanner(
                  allowDuplicates: false,
                  onDetect: (barcode, args) {
                    if (barcode.rawValue == null) {
                      debugPrint('Failed to scan Barcode');
                    } else {
                      final String code = barcode.rawValue!;
                      debugPrint('Barcode found! $code');
                      textFieldValue = code;
                      getID();
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class Scanner extends StatefulWidget {
  const Scanner({Key? key}) : super(key: key);

  @override
  State<Scanner> createState() => _ScannerState();
}

class _ScannerState extends State<Scanner> {
  @override
  Widget build(BuildContext context) {
    return MobileScanner(
      allowDuplicates: false,
      onDetect: (barcode, args) {
        if (barcode.rawValue == null) {
          debugPrint('Failed to scan Barcode');
        } else {
          final String code = barcode.rawValue!;
          debugPrint('Barcode found! $code');
        }
      },
    );
  }
}

//TextField(
//style: const TextStyle(
//color: Colors.black,
//),
//onChanged: (value) {
//textFieldValue = value;
//},
//decoration: const InputDecoration(
//filled: true,
//fillColor: Colors.white,
//hintText: 'Enter Text',
//hintStyle: TextStyle(
//color: Colors.grey,
//),
//border: OutlineInputBorder(
//borderRadius: BorderRadius.all(Radius.circular(10)),
//),
//),
//),

//ElevatedButton(
//onPressed: () {
//getID();
//},
//child: const Text('Next')),
