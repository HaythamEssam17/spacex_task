import 'package:flutter/material.dart';

import 'currentLaunchesPage.dart';
import 'filterPage.dart';
import 'homePage.dart';
import 'previousLaunchesPage.dart';

class BottomNavBarPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => BottomNavBarPageState();
}

class BottomNavBarPageState extends State<BottomNavBarPage> {
  int _selectedIndex = 0;

  List<Widget> _widgetOptions = <Widget>[
    HomePage(), // All Launches Page
    UpComingLaunchesPage(), // Current Launches Page
    PreviousLaunchesPage(), // Previous Launches page
    FilterPage(), // Filter page
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
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.forward_sharp),
            label: 'Upcoming',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.skip_previous),
            label: 'Previous',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Search',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.deepOrange,
        onTap: _onItemTapped,
        type: BottomNavigationBarType.fixed,
      ),
    );
  }
}
