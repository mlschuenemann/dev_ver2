import 'package:flutter/material.dart';

class CartItem extends StatelessWidget {
  final String name;
  final String description;
  final String region;
  final String mhd;
  final double price;
  final String size;
  final Function()? deleteCallback;

  CartItem(
      {required this.name,
      required this.description,
      required this.region,
      required this.mhd,
      required this.deleteCallback(),
      required this.price,
      required this.size,});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 10,
        ),
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(15)),
            color: Colors.grey.shade300,
          ),
          child: ListTile(
            trailing: IconButton(
              onPressed: deleteCallback,
              icon: Icon(Icons.delete),
            ),
            title: Text(name),
            subtitle: Row(
              children: [
                Expanded(
                  flex: 4,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Mindesthaltbarkeitsdatum: $mhd'),
                      Text('Herkunftsregion: $region'),
                      Text('Grösse: $size'),
                    ],
                  ),
                ),
                Center(
                  child: Column(
                    children: [
                      const Text(
                        'Preis',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                        ),
                      ),
                      Text(
                        '$price €',
                        style: const TextStyle(
                          fontWeight: FontWeight.normal,
                          fontSize: 15,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
