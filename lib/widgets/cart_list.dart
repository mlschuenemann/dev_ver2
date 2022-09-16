import 'package:dev_ver2/components/fill_button.dart';
import 'package:flutter/material.dart';
import 'package:dev_ver2/widgets/cart_item.dart';
import 'package:provider/provider.dart';
import 'package:dev_ver2/models/item_data.dart';

class CartList extends StatefulWidget {
  @override
  State<CartList> createState() => _CartListState();
}

class _CartListState extends State<CartList> {
  @override
  Widget build(BuildContext context) {
    return Consumer<ItemData>(
      builder: (context, itemData, child) {
        return Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemBuilder: (context, index) {
                  final item = itemData.items[index];
                  return CartItem(
                    name: itemData.items[index].name,
                    description: itemData.items[index].description,
                    region: itemData.items[index].region,
                    mhd: itemData.items[index].mhd,
                    price: itemData.items[index].price,
                    size: itemData.items[index].size,
                    deleteCallback: () {
                      itemData.deleteItem(item);
                    },
                  );
                },
                itemCount: itemData.items.length,
              ),
            ),
            SizedBox(height: 30),
            Container(

              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Summe',
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.w900,
                          ),
                        ),
                        Text(
                          '${context.select((ItemData c) => c.total).toStringAsFixed(2)} €',
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Container(
                      height: 55,
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: Colors.lightGreenAccent.withOpacity(0.5),
                            spreadRadius: 2,
                            blurRadius: 3,
                            offset: Offset(0, 2), // changes position of shadow
                          ),
                        ],
                        borderRadius: BorderRadius.all(Radius.circular(15)),
                        color: Colors.lightGreenAccent.shade700,
                        gradient: const LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment(0.8, 1),
                          colors: <Color>[
                            Colors.green,
                            Colors.lightGreen,
                          ], // Gradient from https://learnui.design/tools/gradient-generator.html
                          tileMode: TileMode.mirror,
                        ),
                      ),
                      child: const Center(
                        child: Text(
                          'Jetzt Kaufen',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 10,),
          ],
        );
      },
    );
  }
}


