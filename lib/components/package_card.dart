import 'package:flutter/material.dart';
import 'package:dev_ver2/screens/package_scan_page.dart';


class PackageCard extends StatelessWidget {

  Color colour;
  String image;
  String sizeText;
  String priceInfo;
  PackageCard(this.colour, this.image, this.sizeText, this.priceInfo);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: (){
          print('$priceInfo');
        },
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(15)),
            color: colour,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Center(
                child: Image.asset(image,
                  scale: 6,
                ),
              ),
              Text('$sizeText',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.grey.shade500,
              ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
