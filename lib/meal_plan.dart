import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class MealPlanPage extends StatelessWidget {
  final List<String> mealList;

  MealPlanPage({required this.mealList});

  Future<void> _sendPostRequest() async {
    final String prompt = mealList.join(', ');
    final String url = 'http://127.0.0.1:8000/ask/?prompt=$prompt';

    try {
      final response = await http.post(Uri.parse(url));
      if (response.statusCode == 200) {
        print('Response body: ${response.body}');
      } else {
        print('Request failed with status: ${response.statusCode}.');
      }
    } catch (e) {
      print('Error sending request: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    print(mealList);
    return Scaffold(
      appBar: AppBar(),
      body: ListView.builder(
        itemCount: mealList.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(mealList[index]),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          await _sendPostRequest();
        },
        child: const Icon(Icons.send),
      ),
    );
  }
}
