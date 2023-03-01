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
  double _value = 500;
  int _protein = 0;
  int _fat = 0;
  int _carbs = 0;

  Future<String> testAskEndpoint() async {
    // Set up the URL and prompt string for the HTTP request
    final String url = 'http://167.99.155.246:8000/ask/';
    final String prompt = widget.mealList.join(', ');
    final String urlWithQuery = '$url?prompt=Make me a meal plan using $prompt';

    try {
      // Make the HTTP request with the given URL and prompt
      final response = await http.post(
        Uri.parse(urlWithQuery),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode({}),
      );

      // If the response is successful, return the response body
      if (response.statusCode == 200) {
        return response.body;
      } else {
        // If the response is unsuccessful, print the error and return an empty string
        print('Request failed with status: ${response.statusCode}.');
        return '';
      }
    } catch (e) {
      // If there is an error, print the error and return an empty string
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
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Calories: ${_value.round()}',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 24.0,
                  ),
                ),
                Slider(
                  value: _value,
                  min: 500,
                  max: 5000,
                  divisions: 45,
                  label: _value.round().toString(),
                  onChanged: (double value) {
                    setState(() {
                      _value = value;
                    });
                  },
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      TextFormField(
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          labelText: 'Protein',
                        ),
                      ),
                      TextFormField(
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          labelText: 'Fat',
                        ),
                      ),
                      TextFormField(
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          labelText: 'Carbs',
                        ),
                      ),
                      TextFormField(
                        readOnly: true,
                        controller: TextEditingController(text: _responseText),
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Response',
                        ),
                        maxLines: null,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      floatingActionButton: ElevatedButton(
        onPressed: () async {
          final String response = await testAskEndpoint();
          print(response);
          setState(() {
            final decodedResponse = json.decode(response);
            _responseText = decodedResponse["response"]["message"];
          });
        },
        child: Icon(Icons.send),
      ),
    );
  }
}
