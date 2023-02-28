import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'views/first_page.dart';
import 'models/food_items_model.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => FoodItemsModel()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: FirstPage(),
        theme: new ThemeData(
            scaffoldBackgroundColor: Color.fromRGBO(225, 238, 255, 1)),
      ),
    );
  }
}
