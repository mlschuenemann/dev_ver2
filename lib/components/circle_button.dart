import 'package:flutter/material.dart';


class CircleButton extends StatelessWidget {

  CircleButton({required this.buttonIcon,});

  final Icon buttonIcon;


  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      backgroundColor: Colors.grey.shade300,
      radius: 25,
      child: IconButton(
        icon: buttonIcon,
        color: Colors.grey.shade800,
        onPressed: (){
          Navigator.pop(context);
        },
      ),
    );
  }
}