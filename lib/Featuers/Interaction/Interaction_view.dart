import 'package:flutter/material.dart';
import 'package:amozeshyar/Featuers/Interaction/Interaction_controller.dart';

class InteractionView extends StatefulWidget {
  const InteractionView({super.key});

  @override
  State<InteractionView> createState() => _InteractionViewState();
}

final model = InteractionController().model;
final controller = InteractionController();

class _InteractionViewState extends State<InteractionView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(key: model.Interactionscaffoldkey);
  }
}
