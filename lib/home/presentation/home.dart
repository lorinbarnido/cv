import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _Home();
}

class _Home extends State<Home> {
  int selectedIndex = 0;

  static const List<String> selectedPageName = [
    'Home',
    'My Likes',
    'My Cart',
    'Account'
  ];

  @override
  Widget build(BuildContext context) {

    return Scaffold(
    backgroundColor: Colors.deepOrange[50],
    appBar: AppBar(
      title: Text(selectedPageName[selectedIndex], style: TextStyle(color: Colors.brown[500]),),
      centerTitle: true,
      backgroundColor: Colors.red[200],
    ),
    bottomNavigationBar: BottomNavigationBar(
      backgroundColor: Colors.red[100],
      showSelectedLabels: false,
      showUnselectedLabels: false,
      type: BottomNavigationBarType.fixed,
      iconSize: 24.0,
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.home_outlined),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.favorite_border),
          label: 'Likes',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.shopping_cart_outlined),
          label: 'Cart',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.account_circle_outlined),
          label: 'Account',
        ),
      ],
      currentIndex: selectedIndex,
      selectedItemColor: Colors.red[400],
      unselectedItemColor: Colors.brown[300],
      onTap: (int index) {
        setState(() {
          selectedIndex = index;
        });
      },
      ),
    );
  }
}
