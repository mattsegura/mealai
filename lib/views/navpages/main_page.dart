// hold the entire bottom nav bar and take you to the certain page
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:newapp/views/navpages/bar_item_page.dart';
import 'package:newapp/views/navpages/home_page.dart';
import 'package:newapp/views/navpages/my_page.dart';
import 'package:newapp/views/navpages/search_page.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  List pages = [
    // routes to pages
    HomePage(),
    BarItemPage(),
    SearchPage(),
    MyPage(),
  ];
  int currentIndex = 0;
  void onTap(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: pages[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        unselectedFontSize: 0,
        selectedFontSize: 0,
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.white,
        onTap: onTap,
        currentIndex: currentIndex,
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.grey,
        showUnselectedLabels: false,
        showSelectedLabels: false,
        elevation: 0,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.apps),
            label: 'Home', // Add a label or text
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.bar_chart_sharp),
            label: 'Bar', // Add a label or text
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Search', // Add a label or text
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'My', // Add a label or text
          ),
        ],
      ),
    );
  }
}
