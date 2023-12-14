import 'package:flutter/material.dart';
import 'views/yahtzee.dart';

void main() {
  runApp(const MaterialApp(
    debugShowCheckedModeBanner: false,
    title: 'Yahtzee',
    home: Scaffold(
      body: Yahtzee()
    ),
  ));
}
