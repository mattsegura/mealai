import 'package:flutter/material.dart';
import 'package:flutter_launcher_icons/ios.dart';
import 'package:provider/provider.dart';
import 'package:newapp/models/food_items_model.dart';
import 'second_page.dart';
import 'meal_plan.dart';

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
      appBar: AppBar(
        title: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                icon: Icon(Icons.arrow_back),
                onPressed: () {
                  // do something when the back arrow button is tapped
                },
                color: Colors.black,
              ),
              const Text(
                'Today',
                style: TextStyle(
                  color: Colors.black, // set the color of the title text
                ),
              ),
              IconButton(
                icon: Icon(Icons.arrow_forward),
                onPressed: () {
                  // do something when the forward arrow button is tapped
                },
                color: Colors.black,
              ),
            ],
          ),
        ),
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(
            Icons.menu,
            color: Colors.black,
          ),
          onPressed: () {},
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(
                right: 12.0), // set the horizontal padding to 16.0
            child: IconButton(
              icon: const Icon(
                Icons.settings,
                color: Colors
                    .black, // set the color of the search icon button to white
              ),
              onPressed: () {},
            ),
          ),
        ],
        elevation: 0,
      ),
      body: Column(
        children: [
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
                  final foodItemsModel =
                      Provider.of<FoodItemsModel>(context, listen: false);
                  return MealPlanPage(mealList: foodItemsModel.foodItems);
                },
              ),
            );
          }
        },
      ),
    );
  }
}
