import 'package:flutter/material.dart';
import 'package:myteam_2/shared/theme.dart';
import 'package:myteam_2/ui/pages/home.dart';
import 'package:myteam_2/ui/pages/menu.dart';
import 'package:myteam_2/ui/pages/profile/profile.dart';

class NavbarBottom extends StatefulWidget {
  @override
  _NavbarBottomState createState() => _NavbarBottomState();
}

class _NavbarBottomState extends State<NavbarBottom> {
  int _selectedIndex = 0;

  List<Widget> _widgetOptions = <Widget>[Home(), MenuPage(), Profile()];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: cloud,
      body: _widgetOptions.elementAt(_selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.apps),
            label: 'Menu',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.blue[300],
        onTap: _onItemTapped,
      ),
    );
  }
}
