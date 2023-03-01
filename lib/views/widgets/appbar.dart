import 'package:flutter/material.dart';
import 'package:newapp/models/food_items_model.dart';
import 'package:provider/provider.dart';

class MyAppBar extends StatelessWidget implements PreferredSizeWidget {
  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    final foodItemsModel = Provider.of<FoodItemsModel>(context);
    return AppBar(
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
                fontWeight: FontWeight.bold,
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
    );
  }
}
