import 'package:flutter/material.dart';
import 'package:flutter_launcher_icons/ios.dart';
import 'package:provider/provider.dart';
import 'package:newapp/models/food_items_model.dart';
import 'barcode_scanning.dart';
import 'diary_page_view.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'widgets/appbar.dart';
import 'widgets/macro_view.dart';
import 'plan_view.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<FoodItemsModel>(
      create: (context) => FoodItemsModel(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: FirstPage(),
      ),
    );
  }
}

class FirstPage extends StatelessWidget {
  const FirstPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final foodItemsModel = Provider.of<FoodItemsModel>(context);

    return Scaffold(
      appBar: MyAppBar(),
      body: Column(
        children: [
          SizedBox(height: 15),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(18.0),
                    child: Row(
                      children: const [
                        Text(
                          "Macros",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                      padding: const EdgeInsets.symmetric(vertical: 15.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          MacroWidget(
                            label: 'Carbs',
                            value: 120,
                            progressColor: Colors.blue,
                            backgroundColor: Colors.blue.shade100,
                          ),
                          const SizedBox(width: 20),
                          const MacroWidget(
                            label: 'Protein',
                            value: 150,
                            progressColor: Color.fromRGBO(253, 129, 205, 1),
                            backgroundColor: Color.fromRGBO(253, 129, 205, 450),
                          ),
                          const SizedBox(width: 20),
                          const MacroWidget(
                            label: 'Fats',
                            value: 216,
                            progressColor: Color.fromRGBO(255, 193, 26, 1),
                            backgroundColor: Color.fromRGBO(255, 193, 26, 450),
                          ),
                        ],
                      )),
                ],
              ),
            ),
          ),
          Expanded(
            child: Visibility(
              visible: foodItemsModel.foodItems.isNotEmpty,
              child: ListView.builder(
                itemCount: foodItemsModel.foodItems.length,
                itemBuilder: (context, index) {
                  return Dismissible(
                    key: Key(foodItemsModel.foodItems[index]),
                    onDismissed: (direction) {
                      foodItemsModel.removeFoodItem(index);
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
                      title: Text(foodItemsModel.foodItems[index]),
                    ),
                  );
                },
              ),
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            padding:
                const EdgeInsets.symmetric(horizontal: 20.0, vertical: 8.0),
            decoration: const BoxDecoration(
              color: Color(0xFF0066EE),
              borderRadius: BorderRadius.only(),
            ),
            /* child: Row(
              children: [
                Expanded(
                  child: TextField(
                    onSubmitted: (value) {
                      foodItemsModel.addFoodItem(value);
                    },
                    decoration: InputDecoration(
                      hintText: "Search for food",
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
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (BuildContext context) {
                          return SecondPage(
                            onFoodItemsUpdated: (foodItems) {
                              // Add code here to handle the updated food items
                            },
                          );
                        },
                      ),
                    );
                  },
                  icon: Icon(Icons.qr_code_scanner),
                  label: Text('Scan'),
                ),
              ],
            ), */
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        color: Color(0xFF0066EE),
        elevation: 0,
        shape: CircularNotchedRectangle(),
        child: SizedBox(
          height: kBottomNavigationBarHeight,
          child: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            currentIndex: 0,
            backgroundColor: Color(0xFF0066EE),
            selectedItemColor: Colors.white,
            unselectedItemColor: Colors.white,
            items: const [
              BottomNavigationBarItem(label: 'Home', icon: Icon(Icons.home)),
              BottomNavigationBarItem(label: 'Diary', icon: Icon(Icons.book)),
              BottomNavigationBarItem(
                  label: 'Plans', icon: Icon(Icons.spoke_rounded)),
              BottomNavigationBarItem(label: 'More', icon: Icon(Icons.more)),
            ],
            onTap: (index) {
              if (index == 1) {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (BuildContext context) {
                      final foodItemsModel =
                          Provider.of<FoodItemsModel>(context, listen: false);
                      return MealPlanPage(mealList: foodItemsModel.foodItems);
                    },
                  ),
                );
              } else if (index == 2) {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (BuildContext context) {
                      return PlanPage();
                    },
                  ),
                );
              }
            },
          ),
        ),
      ),
    );
  }
}
