
import 'package:dev_ver2/product.dart';

List<Product> productList = [
  Product(id: 1, description: 'lecker', title: 'SPaghetti', MHD: '20.09.2000', region: 'Napoli'),
  Product(id: 2, description: 'sehr lecker', title: 'Linsen', MHD: '20.09.2000', region: 'Napoli'),
  Product(id: 3, description: 'alles lecker', title: 'Nüsse', MHD: '20.09.2000', region: 'Napoli'),
  Product(id: 4, description: 'wirklich sehr lecker', title: 'Mehl', MHD: '20.09.2000', region: 'Napoli'),
];

int ID = productList[checkValue].id;
int checkValue = 1;

void check (){
  print(ID);
}