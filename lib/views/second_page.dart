import 'package:flutter/material.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class SecondPage extends StatefulWidget {
  final Function(List<String> foodItems) onFoodItemsUpdated;

  SecondPage({Key? key, required this.onFoodItemsUpdated}) : super(key: key);

  @override
  _SecondPageState createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  List<String> foodItems = [];

  bool addFoodItem(String productName) {
    if (foodItems.contains(productName)) {
      return false; // Product is already in the list
    }
    foodItems.add(productName);
    return true; // Product added to the list
  }

  Future<String?> getProductInfo(String? barcode) async {
    if (barcode != null) {
      final url =
          'https://world.openfoodfacts.org/api/v0/product/${barcode}.json';
      final response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        final product = json.decode(response.body)['product'];
        final productName = product['product_name'];
        return productName;
      } else {
        debugPrint('Failed to fetch product information');
        return null;
      }
    } else {
      debugPrint('Barcode is null');
      return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Meal AI')),
      body: MobileScanner(
        onDetect: (capture) async {
          final List<Barcode> barcodes = capture.barcodes;
          for (final barcode in barcodes) {
            final productName = await getProductInfo(barcode.rawValue);
            if (productName != null) {
              final added = addFoodItem(productName);
              if (added) {
                debugPrint('Product added to list: $productName');
                widget.onFoodItemsUpdated(foodItems);
              } else {
                debugPrint('Product already in list: $productName');
              }
            }
          }
        },
      ),
    );
  }
}
