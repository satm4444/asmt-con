import 'package:confession/screens/notification_screen.dart';
import 'package:confession/screens/profile_screen.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'home_screen.dart';

class BottomBarScreen extends StatefulWidget {
  @override
  _BottomBarScreenState createState() => _BottomBarScreenState();
}

class _BottomBarScreenState extends State<BottomBarScreen> {
  List<Map<String, Object>> _pages = [];
  int _selectedPageIndex = 0;
  void _selectPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  @override
  void initState() {
    _pages = [
      {'page': HomeScreen(), 'title': 'Home'},
      {'page': NotificationScreen(), 'title': 'Notification'},
      {'page': ProfileScreen(), 'title': 'Profile'},
    ];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedPageIndex]['page'],
      bottomNavigationBar: CurvedNavigationBar(
        onTap: _selectPage,
        index: 0,
        height: 50,
        items: <Widget>[
          Icon(
            Icons.home,
            size: 30,
            color: Colors.white,
          ),
          Icon(
            Icons.notifications_none,
            size: 30,
            color: Colors.white,
          ),
          Icon(
            Icons.person,
            size: 30,
            color: Colors.white,
          ),
        ],
        color: Color(0xffE30045),
        backgroundColor: Color(0xffE30045).withOpacity(0.7),
        animationCurve: Curves.easeInOut,
        animationDuration: Duration(milliseconds: 340),
      ),
    );
  }
}
