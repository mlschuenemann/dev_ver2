import 'package:flutter/material.dart';
import 'package:dev_ver2/models/item.dart';

class ItemData extends ChangeNotifier {

  List<Item> items = [

  ];

  double get total {
    return items.fold(0.0, (double currentTotal, Item nextProduct) {
      return currentTotal + nextProduct.price;
    });
  }

  void addItem(String newGroceryName, String newRegion, String newMHD, String newDescription, double price, String size) {
   final item = Item(name: newGroceryName, region: newRegion, mhd: newMHD, description: newDescription, price: price, size: size);
    items.add(item);
    notifyListeners();
  }

  void deleteItem(Item item) {
    items.remove(item);
    notifyListeners();
  }

}