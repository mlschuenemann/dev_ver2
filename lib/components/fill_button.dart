import 'package:flutter/material.dart';


class FillButton extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          boxShadow: [
      BoxShadow(
      color: Colors.lightGreenAccent.withOpacity(0.5),
      spreadRadius: 2,
      blurRadius: 3,
      offset: Offset(0, 2), // changes position of shadow
    ),],
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
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          Icon(
            Icons.cookie,
            size: 30,
          ),
          SizedBox(
            width: 12,
          ),
          Text(
            'Abfüllen',
            style: TextStyle(
              fontSize: 20,
            ),
          ),
        ],
      ),
    );
  }
}