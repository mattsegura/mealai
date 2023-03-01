import 'package:flutter/material.dart';
import 'package:newapp/models/food_items_model.dart';

Widget _buildFoodItemsList(FoodItemsModel foodItemsModel) {
  return ListView.builder(
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
  );
}
