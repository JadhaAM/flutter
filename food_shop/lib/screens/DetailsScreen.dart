import 'package:flutter/material.dart';

class DetailsScreen extends StatelessWidget {
  final String productName;
  final double price;

  DetailsScreen({required this.productName, required this.price});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(productName)),
      body: Center(
        child: Text(
          '$productName is priced at \$$price',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}
