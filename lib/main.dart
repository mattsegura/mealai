import 'package:flutter/material.dart';
import 'package:flutter_launcher_icons/ios.dart';
import 'second_page.dart';
import 'meal_plan.dart';
import 'globals.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: FirstPage(),
    );
  }
}

class FirstPage extends StatefulWidget {
  const FirstPage({Key? key}) : super(key: key);

  @override
  _FirstPageState createState() => _FirstPageState();
}

List<String> globalFoodItems = [];

class _FirstPageState extends State<FirstPage> {
  List<String> _foodItems = [];
  final TextEditingController _searchController = TextEditingController();

  // This method updates the list of food items when it is called from SecondPage.
  void _handleFoodItemsUpdated(List<String> foodItems) {
    setState(() {
      for (final item in foodItems) {
        if (!_foodItems.contains(item)) {
          _foodItems.add(item);
        }
      }
    });
    print("Food items updated: $_foodItems");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("MealAI"),
      ),
      body: Column(
        children: [
          Expanded(
            child: Visibility(
              visible: _foodItems.isNotEmpty,
              child: ListView.builder(
                itemCount: _foodItems.length,
                itemBuilder: (context, index) {
                  return Dismissible(
                    key: Key(_foodItems[index]),
                    onDismissed: (direction) {
                      setState(() {
                        _foodItems.removeAt(index);
                      });
                    },
                    background: Container(
                      alignment: Alignment.centerRight,
                      padding: EdgeInsets.only(right: 20.0),
                      color: Colors.red,
                      child: const Icon(
                        Icons.delete,
                        color: Colors.white,
                      ),
                    ),
                    child: ListTile(
                      title: Text(_foodItems[index]),
                    ),
                  );
                },
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            child: Container(
              width: MediaQuery.of(context).size.width,
              padding:
                  const EdgeInsets.symmetric(horizontal: 20.0, vertical: 8.0),
              decoration: const BoxDecoration(
                color: Color(0xFF0066EE),
                borderRadius: BorderRadius.only(),
              ),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: _searchController,
                      onSubmitted: (value) {
                        setState(() {
                          _foodItems.add(value);
                        });
                      },
                      decoration: InputDecoration(
                        hintText: "Search for food",
                        prefixIcon: Icon(Icons.search),
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
                            return SecondPage(
                              onFoodItemsUpdated: _handleFoodItemsUpdated,
                            );
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
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white,
        items: const [
          BottomNavigationBarItem(label: 'Home', icon: Icon(Icons.home)),
          BottomNavigationBarItem(label: 'Meal Plan', icon: Icon(Icons.book)),
          BottomNavigationBarItem(label: 'More', icon: Icon(Icons.more))
        ],
        onTap: (index) {
          if (index == 1) {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (BuildContext context) {
                  return MealPlanPage();
                },
              ),
            );
          }
        },
      ),
    );
  }
}
