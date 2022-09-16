import 'package:dev_ver2/screens/cart_page.dart';
import 'package:flutter/material.dart';


class CartButton extends StatelessWidget {

  CartButton({required this.buttonIcon,});

  final Icon buttonIcon;


  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      backgroundColor: Colors.grey.shade300,
      radius: 25,
      child: Image.asset(
        'lib/assets/logoicon.png',
        scale: 4),
      );
  }
}