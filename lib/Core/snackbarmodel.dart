import 'package:amozeshyar/Featuers/Interaction/interaction_controller.dart';
import 'package:flutter/material.dart';

class SnackbarModel {
  BuildContext? get context =>
      InteractionController()
          .model
          .interactionscaffoldkey
          .currentState
          ?.context;

  void showSnackBar(String message, Color color, BuildContext? context) {
    final ctx = context ?? this.context;
    if (ctx == null) return; // اگه context آماده نبود، کاری نکنه
    ScaffoldMessenger.of(
      ctx,
    ).showSnackBar(SnackBar(backgroundColor: color, content: Text(message)));
  }
}
