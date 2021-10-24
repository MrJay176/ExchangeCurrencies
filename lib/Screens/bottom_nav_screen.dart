import 'package:flutter/material.dart';
import 'package:ogbonge/Screens/stats_screen.dart';

import 'home_screen.dart';


//Bottom Nav is stateful
class BottomNavScreen extends StatefulWidget {

  @override
  _BottomNavScreenState createState() => _BottomNavScreenState();

}

class _BottomNavScreenState extends State<BottomNavScreen> {

  //It has list of screens in will navigate to
  final List _screens = [
    HomeScreen(),
    StatsScreen(),
    Scaffold(),
    Scaffold(),
    Scaffold(),
  ];

  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //The Screen in body is gonna be choosen screen from current updated index
      body: _screens[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        //Current Index is equal to index of item on navbar
        //TODO
        //Understand Why The Items are set differently
        onTap: (index) => setState(() => _currentIndex = index),
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.white,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.grey,
        elevation: 0.0,
        //We Map Through Every Item In The List to Create A BottomNavItem
        items: [Icons.home, Icons.insert_chart, Icons.event_note, Icons.info]
            .asMap()
            .map((key, value) => MapEntry(
                  key,
                  BottomNavigationBarItem(
                    title: Text(''),
                    icon: Container(
                      padding: const EdgeInsets.symmetric(
                        vertical: 6.0,
                        horizontal: 16.0,
                      ),
                      decoration: BoxDecoration(
                        color: _currentIndex == key
                            ? Colors.blue[600]
                            : Colors.transparent,
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      child: Icon(value),
                    ),
                  ),
                ))
            .values
            .toList(),
      ),
    );
  }
}
