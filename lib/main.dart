import 'package:flutter/material.dart';
import 'second_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String buttonName = 'Click';
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: FirstPage(),
    );
  }
}

class FirstPage extends StatelessWidget {
  const FirstPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("MealAI"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Center(
            child: ElevatedButton(
              onPressed: () {
                // adding new page
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (BuildContext context) {
                      return const SecondPage();
                    },
                  ),
                );
              },
              child: const Text('Scan Food Item'),
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 0,
        backgroundColor: Color(0xFF0066EE),
        selectedItemColor:
            Colors.white, // set the color of the selected icon and label
        unselectedItemColor:
            Colors.white, // set the color of the unselected icon and label
        items: const [
          BottomNavigationBarItem(label: 'Home', icon: Icon(Icons.home)),
          BottomNavigationBarItem(label: 'Diary', icon: Icon(Icons.book)),
          BottomNavigationBarItem(label: 'More', icon: Icon(Icons.more))
        ],
      ),
    );
  }
}
