import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class MealPlanPage extends StatefulWidget {
  final List<String> mealList;

  MealPlanPage({required this.mealList});

  @override
  _MealPlanPageState createState() => _MealPlanPageState();
}

class _MealPlanPageState extends State<MealPlanPage> {
  String _responseText = '';

  Future<String> testAskEndpoint() async {
    final String url = 'http://167.99.155.246:8000/ask/';
    final String prompt = widget.mealList.join(', ');
    final String urlWithQuery = '$url?prompt=$prompt';

    try {
      final response = await http.post(
        Uri.parse(urlWithQuery),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode({}),
      );

      if (response.statusCode == 200) {
        return response.body;
      } else {
        print('Request failed with status: ${response.statusCode}.');
        return '';
      }
    } catch (e) {
      print('Error sending request: $e');
      return '';
    }
  }

  Future<void> _sendPostRequest() async {
    final String prompt = widget.mealList.join(', ');
    final String url = 'http://167.99.155.246:8000/ask/';

    try {
      final response = await http.post(
        Uri.parse(url),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode({'prompt': prompt}),
      );
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
    print(widget.mealList);
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: widget.mealList.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(widget.mealList[index]),
                );
              },
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                readOnly: true,
                controller: TextEditingController(text: _responseText),
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Response',
                ),
                maxLines: null,
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: ElevatedButton(
        onPressed: () async {
          final String response = await testAskEndpoint();
          print(response);
          setState(() {
            _responseText = response;
          });
        },
        child: Icon(Icons.send),
      ),
    );
  }
}
