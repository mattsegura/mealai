import 'package:flutter/material.dart';

class PlanPage extends StatelessWidget {
  const PlanPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Plan Page'),
      ),
      body: Center(
        child: Text('This is a blank Plan Page'),
      ),
    );
  }
}
