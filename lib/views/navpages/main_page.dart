// hold the entire bottom nav bar and take you to the certain page
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:newapp/views/navpages/diary_page.dart';
import 'package:newapp/views/navpages/dashboard_page.dart';
import 'package:newapp/views/navpages/more_page.dart';
import 'package:newapp/views/navpages/plans_page.dart';

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
            icon: Icon(Icons.dashboard),
            label: 'Dashboard', // Add a label or text
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.book),
            label: 'Diary', // Add a label or text
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.chat_rounded),
            label: 'Plans', // Add a label or text
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.more),
            label: 'More', // Add a label or text
          ),
        ],
      ),
    );
  }
}
