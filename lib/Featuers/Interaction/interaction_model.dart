import 'package:get/get.dart';
import 'package:flutter/material.dart';

class InteractionModel extends GetxController {
  late GlobalKey<ScaffoldState> interactionscaffoldkey;

  late GlobalKey<FormState> interactionformkey;
  late TextEditingController milktext;
  late TextEditingController skintext;
  late TextEditingController nametext;
  late TextEditingController agetext;
  late TextEditingController gendertext;
  late TextEditingController getamoundtext;
  late TextEditingController getyakslisttext;
  late FocusNode milknode;
  late FocusNode skinnode;
  late FocusNode namenode;
  late FocusNode agenode;
  late FocusNode gendernode;
  //vars
  InteractionModel() {
    interactionscaffoldkey = GlobalKey<ScaffoldState>();

    interactionformkey = GlobalKey<FormState>();
    milktext = TextEditingController();
    skintext = TextEditingController();
    nametext = TextEditingController();
    agetext = TextEditingController();
    gendertext = TextEditingController();
    getamoundtext = TextEditingController();
    getyakslisttext = TextEditingController();
    milknode = FocusNode();
    skinnode = FocusNode();
    namenode = FocusNode();
    agenode = FocusNode();
    gendernode = FocusNode();
  }
}
