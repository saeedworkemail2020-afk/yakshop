import 'package:get/get.dart';
import 'package:flutter/material.dart';

class InteractionModel extends GetxController {
  late GlobalKey<ScaffoldState> interactionscaffoldkey;

  late TextEditingController milktext;
  late TextEditingController skintext;
  late TextEditingController nametext;
  late TextEditingController agetext;
  late TextEditingController getamoundtext;
  late TextEditingController getyakslisttext;
  late TextEditingController getdayordertext;
  late FocusNode milknode;
  late FocusNode skinnode;
  late FocusNode namenode;
  late FocusNode agenode;
  //vars
  InteractionModel() {
    interactionscaffoldkey = GlobalKey<ScaffoldState>();

    milktext = TextEditingController();
    skintext = TextEditingController();
    nametext = TextEditingController();
    agetext = TextEditingController();
    getamoundtext = TextEditingController();
    getyakslisttext = TextEditingController();
    getdayordertext = TextEditingController();
    milknode = FocusNode();
    skinnode = FocusNode();
    namenode = FocusNode();
    agenode = FocusNode();
  }
  RxString gender = 'f'.obs;
}
