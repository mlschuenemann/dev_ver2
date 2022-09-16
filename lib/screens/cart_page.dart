import 'package:flutter/material.dart';
import 'package:dev_ver2/widgets/cart_list.dart';
import 'package:dev_ver2/models/item_data.dart';

class CartPage extends StatefulWidget {
  static const id = 'CartPage';
  const CartPage({Key? key}) : super(key: key);

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.only(left: 30, right: 30, top: 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text(
                  'Warenkorb',
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey.shade900,
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Expanded(
                  flex: 8,
                  child: CartList()),
              const SizedBox(height: 10),
            ],
          ),
        ),
      ),
    );
  }
}