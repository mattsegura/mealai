import 'package:flutter/material.dart';
import 'package:flutter_launcher_icons/ios.dart';
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
      body: Stack(
        children: [
          Positioned(
            bottom: 0,
            child: Container(
              width: MediaQuery.of(context).size.width,
              padding:
                  const EdgeInsets.symmetric(horizontal: 20.0, vertical: 8.0),
              decoration: const BoxDecoration(
                color: Color(0xFF0066EE),
                borderRadius: BorderRadius.only(
                    // topLeft: Radius.circular(20.0),
                    // topRight: Radius.circular(20.0),
                    ),
              ),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: "Search",
                        border: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.circular(30.0),
                        ),
                        filled: true,
                        fillColor: Colors.white,
                        contentPadding: const EdgeInsets.all(8.0),
                      ),
                    ),
                  ),
                  const SizedBox(width: 8.0),
                  ElevatedButton.icon(
                    onPressed: () {
                      // adding new page
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (BuildContext context) {
                            return SecondPage();
                          },
                        ),
                      );
                    },
                    icon: Icon(Icons.qr_code_scanner),
                    label: Text('Scan'),
                  ),
                ],
              ),
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


/*
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
*/