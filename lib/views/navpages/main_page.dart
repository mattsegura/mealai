// hold the entire bottom nav bar and take you to the certain page
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:newapp/views/navpages/diary_page.dart';
import 'package:newapp/views/navpages/dashboard_page.dart';
import 'package:newapp/views/navpages/settings_page.dart';
import 'package:newapp/views/navpages/plans_page.dart';
import 'package:newapp/views/navpages/addfood_page.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final List<Widget> pages = [
    HomePage(),
    BarItemPage(),
    SearchPage(),
    MyPage(),
    ProfilePage(), // add new page here
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
      body: Navigator(
        onGenerateRoute: (settings) {
          return MaterialPageRoute(builder: (context) => pages[currentIndex]);
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.white,
        onPressed: () {},
        tooltip: 'Increment',
        child: Icon(
          Icons.add,
          color: Colors.black,
        ),
      ),
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
            label: 'Dashboard',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.book),
            label: 'Diary',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.chat_rounded),
            label: 'Plans',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'More',
          ),
        ],
      ),
    );
  }
}
