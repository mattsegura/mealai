import 'package:flutter/material.dart';
import 'package:newapp/models/food_items_model.dart';
import 'package:provider/provider.dart';

class MyAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final bool showArrows;
  final bool showMenuButton;
  final bool showSettingsButton;

  const MyAppBar({
    Key? key,
    required this.title,
    this.showArrows = true,
    this.showMenuButton = true,
    this.showSettingsButton = true,
  }) : super(key: key);

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (showArrows)
              IconButton(
                icon: Icon(Icons.arrow_back),
                onPressed: () {
                  // do something when the back arrow button is tapped
                },
                color: Colors.black,
              ),
            Text(
              title,
              style: TextStyle(
                color: Colors.black, // set the color of the title text
                fontWeight: FontWeight.bold,
              ),
            ),
            if (showArrows)
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
      leading: showMenuButton
          ? IconButton(
              icon: const Icon(
                Icons.menu,
                color: Colors.black,
              ),
              onPressed: () {},
            )
          : null,
      actions: showSettingsButton
          ? [
              Padding(
                padding: const EdgeInsets.only(
                  right: 12.0,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  right: 12.0,
                ),
                child: IconButton(
                  icon: const Icon(
                    Icons.settings,
                    color: Colors.black,
                  ),
                  onPressed: () {},
                ),
              ),
            ]
          : [],
      elevation: 0,
    );
  }
}
