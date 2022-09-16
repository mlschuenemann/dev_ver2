import 'package:dev_ver2/models/item_data.dart';
import 'package:dev_ver2/screens/braintree_test.dart';
import 'package:dev_ver2/screens/grocery_scan_page.dart';
import 'package:dev_ver2/screens/package_scan_page.dart';
import 'package:dev_ver2/screens/cart_page.dart';
import 'package:dev_ver2/screens/profile_page.dart';
import 'package:dev_ver2/screens/register_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:dev_ver2/screens/register_screen.dart';
import 'package:dev_ver2/components/bottom_navigation_bar.dart';
import 'package:dev_ver2/screens/login_screen.dart';
import 'package:dev_ver2/screens/payment_test.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => ItemData(),
        ),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: Register.id,
      routes: {
        GroceryScanPage.id: (context) => const GroceryScanPage(),
        PackageScanPage.id: (context) =>
            PackageScanPage('SuE1jS3fKrZZWBPgm5GH'),
        CartPage.id: (context) => const CartPage(),
        ProfilePage.id: (context) => const ProfilePage(),
        Register.id: (context) => const Register(),
        NavigationBar.id: (context) => const NavigationBar(),
        Login.id: (context) => const Login(),
        Braintree.id: (context) => const Braintree(),
      },
    );
  }
}

class NavigationBar extends StatefulWidget {
  const NavigationBar({Key? key}) : super(key: key);
  static const String id = 'NavigationBar';

  @override
  State<NavigationBar> createState() => _NavigationBar();
}

class _NavigationBar extends State<NavigationBar> {
  int _selectedIndex = 1;
  static const TextStyle optionStyle =
  TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static const List<Widget> _widgetOptions = <Widget>[
    CartPage(),
    GroceryScanPage(),
    ProfilePage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.green,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: FaIcon(FontAwesomeIcons.basketShopping,
            size: 25),
            label: 'Warenkorb',
          ),
          BottomNavigationBarItem(
            icon: FaIcon(FontAwesomeIcons.faceSmile,
            size: 25),
            label: 'Neu',
          ),
          BottomNavigationBarItem(
            icon: FaIcon(FontAwesomeIcons.user,
            size: 25),
            label: 'Profil',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.white,
        onTap: _onItemTapped,
      ),
    );
  }
}


//initialRoute: NavigationBar.id,