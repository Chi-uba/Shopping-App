import 'package:flutter/material.dart';
import 'package:shopping_app/screens/favorite_screen.dart';
import 'package:shopping_app/screens/home.dart';
import 'package:shopping_app/screens/my_cart_screen.dart';
import 'AppData.dart';

class ScreenController extends StatefulWidget {
  const ScreenController({Key? key}) : super(key: key);

  @override
  _ScreenControllerState createState() => _ScreenControllerState();
}

class _ScreenControllerState extends State<ScreenController> {
  // helps the screen controller keep track of screen interactions
  int _selectedscreen = 0;
// list of screens available
  List<Widget> screens = <Widget>[
    Home(),
    FavoriteScreen(),
    MyCartScreen(),
    Container(),
  ];
// a void function that updates _selectedscreen variable
  void _updateScreen(int index){
    setState(() {
      _selectedscreen = index;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Shopping App'),
      ),
      body: screens[_selectedscreen],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.black,
        unselectedItemColor: Colors.white,
        selectedItemColor: Colors.white,
        currentIndex: _selectedscreen,
        onTap: _updateScreen,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
              icon: Icon(Icons.account_balance),
              label: 'Explore'
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.add_box_outlined),
              label: 'Favorites'
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.add_shopping_cart_sharp ),
              label: 'My Cart'
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.accessibility_outlined),
              label: 'My Profile'
          ),
        ],
      ),
    );
  }
}
