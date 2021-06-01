import 'package:final_major_project/centers.dart';
import 'package:final_major_project/feedback.dart';
import 'package:final_major_project/settings.dart';
import 'package:final_major_project/visit.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_snake_navigationbar/flutter_snake_navigationbar.dart';


class navBar extends StatefulWidget {
  @override
  _navBarState createState() => _navBarState();
}

class _navBarState extends State<navBar> {

  List<Widget> _widgetOptions = <Widget> [
    centersList(),
    VisitorsList(),
    FeedBack(),
    SettingList(),
  ];

  int _selectedItemPosition = 0;

  SnakeBarBehaviour snakeBarStyle = SnakeBarBehaviour.pinned;
  SnakeShape snakeShape = SnakeShape.indicator;
  final padding = EdgeInsets.zero;
  ShapeBorder bottomBarShape = RoundedRectangleBorder(borderRadius: BorderRadius.only(topLeft: Radius.circular(25)));

  bool showSelectedLabels = true;
  bool showUnselectedLabels = true;

  Color selectedColor = Color(0xFF35BB9B);


  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Center(
        child: Container(
          child: _widgetOptions.elementAt(_selectedItemPosition),
        ),
      ),
      backgroundColor: Color(0xFFE5E8EC),
      bottomNavigationBar: SnakeNavigationBar.color(
        // height: 80,
        behaviour: snakeBarStyle,
        snakeShape: snakeShape,
        shape: bottomBarShape,
        padding: padding,

        ///configuration for SnakeNavigationBar.color
        snakeViewColor: selectedColor,
        selectedItemColor:
        snakeShape == SnakeShape.indicator ? selectedColor : null,
        unselectedItemColor: Colors.grey.shade800,

        ///configuration for SnakeNavigationBar.gradient
        // snakeViewGradient: selectedGradient,
        // selectedItemGradient: snakeShape == SnakeShape.indicator ? selectedGradient : null,
        // unselectedItemGradient: unselectedGradient,

        showUnselectedLabels: showUnselectedLabels,
        showSelectedLabels: showSelectedLabels,

        currentIndex: _selectedItemPosition,
        onTap: (index) => setState(() => _selectedItemPosition = index),
        items: [
          const BottomNavigationBarItem(
              icon: Icon(Icons.night_shelter_outlined), label: 'Centers'),
          const BottomNavigationBarItem(
              icon: Icon(Icons.bookmark_outlined), label: 'Visiting'),
          const BottomNavigationBarItem(
              icon: Icon(Icons.feedback), label: 'Feedback'),
          const BottomNavigationBarItem(
              icon: Icon(Icons.settings), label: 'Settings'),
        ],
        selectedLabelStyle: const TextStyle(fontSize: 15),
        unselectedLabelStyle: const TextStyle(fontSize: 14),
      ),
    );
  }
}

