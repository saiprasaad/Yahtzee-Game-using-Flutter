import 'package:collection/collection.dart';
import 'dart:math';

import 'package:flutter/material.dart';


class Dice with ChangeNotifier{
  int turns = 0;
  bool initialized = false;
  final List<int?> _values;
  final List<bool> _held;


  Dice(int numDice) 
  : _values = List<int?>.filled(numDice, null),
    _held = List<bool>.filled(numDice, false);

  List<int> get values => List<int>.unmodifiable(_values.whereNotNull());

  int? operator [](int index) => _values[index];

  bool isHeld(int index) => _held[index];

  void clear() {
    for (var i = 0; i < _values.length; i++) {
      _values[i] = null;
      _held[i] = false;
      turns = 0;
      notifyListeners();
    }
  }

  void roll() {
    for (var i = 0; i < _values.length; i++) {
      if (!_held[i]) {
        _values[i] = Random().nextInt(6) + 1;
      }
    }
  }

  void toggleHold(int index) {
    _held[index] = !_held[index];
    notifyListeners();
  }

  void performRollCount() {
    turns++;
    initialized = !initialized;
    roll();
    notifyListeners();
  }
}
