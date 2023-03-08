import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter/widgets.dart';
import 'package:newapp/views/widgets/appbar.dart';
import 'package:newapp/views/widgets/macro_view.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
