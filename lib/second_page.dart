import 'dart:typed_data';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:mobile_scanner/mobile_scanner.dart';

class SecondPage extends StatelessWidget {
  SecondPage({super.key});

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
        // debugPrint('Product Name: $productName');
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
    // This builds a new widget, which consists of a Scaffold.
    return Scaffold(
      // The Scaffold has an AppBar at the top.
      appBar: AppBar(title: const Text('Meal AI')),
      // The body of the Scaffold is a MobileScanner widget.
      body: MobileScanner(
        // When a barcode is detected, the onDetect callback is triggered.
        onDetect: (capture) async {
          // The capture parameter is a CaptureResult object that contains information about the captured image and detected barcodes.
          final List<Barcode> barcodes = capture.barcodes;
          // The for loop iterates over each detected barcode and looks up the product information using the Open Food Facts API.
          for (final barcode in barcodes) {
            // get the barcode raw value
            // debugPrint('Barcode found! ${barcode.rawValue}');
            final productName = await getProductInfo(barcode.rawValue);
            if (productName != null) {
              final added = addFoodItem(productName);
              if (added) {
                debugPrint('Product added to list: $productName');
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
