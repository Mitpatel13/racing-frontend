import 'package:flutter/material.dart';
import 'package:untitled/modules/home/home_scr.dart';
import 'package:untitled/modules/menu/menu_scr.dart';
import 'package:untitled/utils/app_color.dart';

class RacePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('Race Page'),
    );
  }
}

class ResultPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('Result Page'),
    );
  }
}

class CashierPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('Cashier Page'),
    );
  }
}



class BottomBarScreen extends StatefulWidget {
  @override
  _BottomBarScreenState createState() => _BottomBarScreenState();
}

class _BottomBarScreenState extends State<BottomBarScreen> {
  int _selectedIndex = 2;

  static List<Widget> _pages = <Widget>[
    RacePage(),
    ResultPage(),
    HomeScr(),
    CashierPage(),
    MenuScr(),
  ];

  static const List<String> _pageTitles = ['Race', 'Result', 'Home', 'Cashier', 'Menu'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(

        currentIndex: _selectedIndex,
        fixedColor: AppColor.primaryColor,unselectedLabelStyle: TextStyle(color: AppColor.white),
        showUnselectedLabels: true,


        onTap: _onItemTapped,
        items: <BottomNavigationBarItem>[

          BottomNavigationBarItem(
            backgroundColor: AppColor.secondaryColor,
            icon: Icon(Icons.directions_run),
            label: 'Race',

          ),
          BottomNavigationBarItem(
            backgroundColor: AppColor.secondaryColor,

            icon: Icon(Icons.signal_cellular_alt),
            label: 'Result',
          ),
          BottomNavigationBarItem(
            backgroundColor: AppColor.secondaryColor,

            icon: Icon(Icons.home),
            label: 'Home',

          ),
          BottomNavigationBarItem(
            backgroundColor: AppColor.secondaryColor,

            icon: Icon(Icons.currency_rupee),
            label: 'Cashier',
          ),
          BottomNavigationBarItem(
            backgroundColor: AppColor.secondaryColor,

            icon: Icon(Icons.menu),
            label: 'Menu',
          ),
        ],
      ),
    );
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
}

