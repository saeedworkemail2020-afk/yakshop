import 'package:flutter/material.dart';

class SnackbarModel {
  void showSnackBar(String message, BuildContext context, Color color) {
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(SnackBar(backgroundColor: color, content: Text(message)));
  }
}
