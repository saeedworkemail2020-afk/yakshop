import 'package:amozeshyar/Featuers/Interaction/interaction_controller.dart';
import 'package:flutter/material.dart';

class SnackbarModel {
  final context =
      InteractionController()
          .model
          .interactionscaffoldkey
          .currentState!
          .context;
  void showSnackBar(String message, Color color, BuildContext? context) {
    context ??= this.context;
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(SnackBar(backgroundColor: color, content: Text(message)));
  }
}
