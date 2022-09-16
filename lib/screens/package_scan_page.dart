import 'package:dev_ver2/components/cart_button.dart';
import 'package:flutter/material.dart';
import 'package:dev_ver2/components/package_card.dart';
import 'package:dev_ver2/components/fill_button.dart';
import 'package:dev_ver2/components/circle_button.dart';
import 'package:dev_ver2/models/item_data.dart';
import 'package:provider/provider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dev_ver2/old/grocery_class.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:dev_ver2/components/package_info_card.dart';
import 'package:dev_ver2/components/data_pass.dart';
import 'package:dev_ver2/old/grocery_class.dart';

class PackageScanPage extends StatefulWidget {
  static const String id = 'PackageScanPage';

  final String documentId;
  PackageScanPage(this.documentId);

  @override
  State<PackageScanPage> createState() => _PackageScanPageState();
}

int helper = 5;

enum Package {
  mini,
  small,
  medium,
  large,
}

class _PackageScanPageState extends State<PackageScanPage> {
  Future<DocumentSnapshot<Map<String, dynamic>>> future = FirebaseFirestore
      .instance
      .collection('groceries')
      .doc('8VaIqWc4VhJMVJYKzau0')
      .get();

  Future<DocumentSnapshot<Map<String, dynamic>>> future2 = FirebaseFirestore
      .instance
      .collection('groceries')
      .doc('SuE1jS3fKrZZWBPgm5GH')
      .get();

  @override
  void initState() {
    // TODO: implement initState
    future = FirebaseFirestore.instance
        .collection('groceries')
        .doc(widget.documentId)
        .get();
    super.initState();
  }

  String priceGetter() {
    if (helper == 0) {
      return 'price_mini';
    } else if (helper == 1) {
      return 'price_small';
    } else if (helper == 2) {
      return 'price_medium';
    } else if (helper == 3) {
      return 'price_large';
    } else {
      return '';
    }
  }

Package selectedPackage = Package.medium;

  String SizeGetter (){
    if(selectedPackage == Package.mini){
      return 'Mini';
    }
    else if(selectedPackage == Package.small){
      return 'Klein';
    }
    else if(selectedPackage == Package.medium){
      return 'Medium';
    }
    else {return 'Gross';}
  }

  @override
  Widget build(BuildContext context) {
    final _firestore = FirebaseFirestore.instance;
    final textFieldValue = ModalRoute.of(context)!.settings.arguments;

    CollectionReference users =
        FirebaseFirestore.instance.collection('groceries');

    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.only(left: 30, right: 30, top: 30, bottom: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CircleButton(
                    buttonIcon: const Icon(Icons.arrow_back),
                  ),
                  CartButton(
                    buttonIcon: const Icon(Icons.shopping_cart),
                  ),
                ],
              ),
              const SizedBox(
                height: 30,
              ),
              FutureBuilder<DocumentSnapshot>(
                future: future,
                builder: (BuildContext context,
                    AsyncSnapshot<DocumentSnapshot> snapshot) {
                  if (snapshot.hasError) {
                    return Text("Something went wrong");
                  }
                  if (snapshot.hasData && !snapshot.data!.exists) {
                    return Text("Document does not exist");
                  }
                  if (snapshot.connectionState == ConnectionState.done) {
                    Map<String, dynamic> data =
                        snapshot.data!.data() as Map<String, dynamic>;
                    return InfoCard(data: data);
                  }
                  return Text("loading");
                },
              ),
              const SizedBox(
                height: 25,
              ),
              Text(
                'Behätlnis wählen',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.normal,
                  color: Colors.grey.shade900,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Expanded(
                flex: 2,
                child: Row(
                  children: [
                    Expanded(
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            helper = 0;
                            selectedPackage = Package.mini;
                          });
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius:
                                const BorderRadius.all(Radius.circular(15)),
                            color: selectedPackage == Package.mini ? Colors.grey.shade300 : Colors.grey.shade200,
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Center(
                                child: Image.asset(
                                  'lib/assets/mini.png',
                                  scale: 6,
                                ),
                              ),
                              const Text(
                                'MINI',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.grey,
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),

                    const SizedBox(
                      width: 10,
                    ),

                    Expanded(
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            helper = 1;
                            selectedPackage = Package.small;
                          });
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(15)),
                            color: selectedPackage == Package.small ? Colors.grey.shade300 : Colors.grey.shade200,
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Center(
                                child: Image.asset(
                                  'lib/assets/small.png',
                                  scale: 6,
                                ),
                              ),
                              Text(
                                'KLEIN',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.grey.shade500,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Expanded(
                flex: 2,
                child: Row(
                  children: [

                    Expanded(
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            helper = 2;
                            selectedPackage = Package.medium;
                          });
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(15)),
                            color: selectedPackage == Package.medium ? Colors.grey.shade300 : Colors.grey.shade200,
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Center(
                                child: Image.asset(
                                  'lib/assets/medium.png',
                                  scale: 6,
                                ),
                              ),
                              Text(
                                'MEDIUM',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.grey.shade500,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),

                    const SizedBox(
                      width: 10,
                    ),

                    Expanded(
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            helper = 3;
                            selectedPackage = Package.large;
                          });
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(15)),
                            color: selectedPackage == Package.large ? Colors.grey.shade300 : Colors.grey.shade200,
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Center(
                                child: Image.asset(
                                  'lib/assets/big.png',
                                  scale: 6,
                                ),
                              ),
                              Text(
                                'GROß',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.grey.shade500,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 25,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Preis',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                  const SizedBox(width: 200),
                  FutureBuilder<DocumentSnapshot>(
                    future: users.doc(widget.documentId).get(),
                    builder: (BuildContext context,
                        AsyncSnapshot<DocumentSnapshot> snapshot) {
                      if (snapshot.hasError) {
                        return Text("Something went wrong");
                      }

                      if (snapshot.hasData && !snapshot.data!.exists) {
                        return Text("Document does not exist");
                      }

                      if (snapshot.connectionState == ConnectionState.done) {
                        Map<String, dynamic> data =
                        snapshot.data!.data() as Map<String, dynamic>;
                        return Expanded(
                          child: Text(
                            '${data[priceGetter()]} €',
                            style: const TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.w900,
                            ),
                          ),
                        );
                      }
                      return SizedBox(height: 27,);
                    },
                  ),
                ],
              ),

              const SizedBox(
                height: 25,
              ),
              FutureBuilder<DocumentSnapshot>(
                future: future,
                builder: (BuildContext context,
                    AsyncSnapshot<DocumentSnapshot> snapshot) {
                  if (snapshot.hasError) {
                    return Text("Something went wrong");
                  }

                  if (snapshot.hasData && !snapshot.data!.exists) {
                    return Text("Document does not exist");
                  }

                  if (snapshot.connectionState == ConnectionState.done) {
                    Map<String, dynamic> data =
                        snapshot.data!.data() as Map<String, dynamic>;
                    return Expanded(
                      child: GestureDetector(
                        onTap: () {
                          getGrocery();
                          Provider.of<ItemData>(context, listen: false).addItem(
                              '${data['name']}',
                              '${data['region']}',
                              '${data['mhd']}',
                              '${data['description']}',
                              data[priceGetter()],
                            SizeGetter(),
                          );
                          Navigator.pop(context);
                        },
                        child: FillButton(),
                      ),
                    );
                  }
                  return Text("loading");
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
