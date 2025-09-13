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
  void initState() {
    super.initState();
    controller.services.getdata();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: model.interactionscaffoldkey,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Center(child: Text('Total Amount')),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [Text("Milk:100"), Text('Skin:80')],
              ),
              Padding(
                padding: const EdgeInsets.all(10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor: WidgetStateProperty.all(
                          Colors.black45,
                        ),
                        fixedSize: WidgetStateProperty.all(
                          Size(
                            controller.screenSize.height * 0.12,
                            controller.screenSize.height * 0.06,
                          ),
                        ),
                        shape: WidgetStateProperty.all(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                        ),
                        shadowColor: WidgetStateProperty.all(Colors.brown),
                        elevation: WidgetStateProperty.all(5),
                      ),
                      onPressed: () async {},
                      child: Text(
                        "Send",
                        style: TextStyle(
                          fontSize: controller.screenSize.buttonfontsize,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    SizedBox(width: controller.screenSize.width * 0.01),
                    SizedBox(
                      width: controller.screenSize.width * 0.12,
                      height: controller.screenSize.width * 0.1,
                      child: TextField(
                        cursorColor: Colors.orange,
                        controller: model.getamoundtext,
                        keyboardType: TextInputType.name,
                        decoration: InputDecoration(
                          hintText: "Day",
                          hintTextDirection: TextDirection.ltr,
                          hintStyle: TextStyle(
                            fontSize: controller.screenSize.fieldtextsize,
                          ),
                          filled: true,
                          fillColor: Colors.black12,
                          border: const OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                          ),
                        ),
                        textInputAction: TextInputAction.next,
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                  top: controller.screenSize.height * 0.030,
                  bottom: controller.screenSize.height * 0.025,
                ),
                child: Center(child: Text('Order')),
              ),
              Form(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    // Milk TextField
                    Padding(
                      padding: EdgeInsets.only(
                        left: controller.screenSize.width * 0.06,
                        right: controller.screenSize.width * 0.06,
                      ),
                      child: TextFormField(
                        cursorColor: Colors.orange,
                        controller: model.milktext,
                        focusNode: model.skinnode,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          hintText: "Milk",
                          hintTextDirection: TextDirection.ltr,
                          hintStyle: TextStyle(
                            fontSize: controller.screenSize.fieldtextsize,
                          ),
                          filled: true,
                          fillColor: Colors.black12,
                          border: const OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(20)),
                          ),
                          prefixIcon: const Icon(Icons.water_drop_sharp),
                        ),
                        textInputAction: TextInputAction.next,
                      ),
                    ),
                    SizedBox(height: controller.screenSize.height * 0.01),
                    //  skin TextField
                    Padding(
                      padding: EdgeInsets.only(
                        left: controller.screenSize.width * 0.06,
                        right: controller.screenSize.width * 0.06,
                      ),
                      child: TextFormField(
                        cursorColor: Colors.orange,
                        controller: model.skintext,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          hintText: "Skin",
                          hintStyle: TextStyle(
                            fontSize: controller.screenSize.fieldtextsize,
                          ),
                          hintTextDirection: TextDirection.ltr,
                          filled: true,
                          fillColor: Colors.black12,
                          border: const OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(20)),
                          ),
                          prefixIcon: Icon(Icons.assessment_sharp),
                        ),
                        textInputAction: TextInputAction.next,
                      ),
                    ),
                    SizedBox(height: controller.screenSize.height * 0.01),

                    // send button
                    ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor: WidgetStateProperty.all(
                          Colors.lightBlue,
                        ),
                        fixedSize: WidgetStateProperty.all(
                          Size(
                            controller.screenSize.height * 0.3,
                            controller.screenSize.height * 0.06,
                          ),
                        ),
                        shape: WidgetStateProperty.all(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                        ),
                        shadowColor: WidgetStateProperty.all(Colors.blue),
                        elevation: WidgetStateProperty.all(5),
                      ),
                      onPressed: () async {},
                      child: Text(
                        "Send",
                        style: TextStyle(
                          fontSize: controller.screenSize.buttonfontsize,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    SizedBox(height: controller.screenSize.height * 0.01),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                  top: controller.screenSize.height * 0.030,
                  bottom: controller.screenSize.height * 0.025,
                ),
                child: Center(child: Text('Yak info')),
              ),
              Form(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    // name TextField
                    Padding(
                      padding: EdgeInsets.only(
                        left: controller.screenSize.width * 0.06,
                        right: controller.screenSize.width * 0.06,
                      ),
                      child: TextFormField(
                        cursorColor: Colors.orange,
                        controller: model.nametext,
                        focusNode: model.agenode,
                        keyboardType: TextInputType.name,
                        decoration: InputDecoration(
                          hintText: "Name",
                          hintTextDirection: TextDirection.ltr,
                          hintStyle: TextStyle(
                            fontSize: controller.screenSize.fieldtextsize,
                          ),
                          filled: true,
                          fillColor: Colors.black12,
                          border: const OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(20)),
                          ),
                          prefixIcon: const Icon(Icons.person),
                        ),
                        textInputAction: TextInputAction.next,
                      ),
                    ),
                    SizedBox(height: controller.screenSize.height * 0.01),
                    // Age TextField
                    Padding(
                      padding: EdgeInsets.only(
                        left: controller.screenSize.width * 0.06,
                        right: controller.screenSize.width * 0.06,
                      ),
                      child: TextFormField(
                        cursorColor: Colors.orange,
                        controller: model.agetext,
                        focusNode: model.gendernode,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          hintText: "Age",
                          hintTextDirection: TextDirection.ltr,
                          hintStyle: TextStyle(
                            fontSize: controller.screenSize.fieldtextsize,
                          ),
                          filled: true,
                          fillColor: Colors.black12,
                          border: const OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(20)),
                          ),
                          prefixIcon: const Icon(Icons.calendar_month),
                        ),
                        textInputAction: TextInputAction.next,
                      ),
                    ),
                    SizedBox(height: controller.screenSize.height * 0.01),
                    //  Gender TextField
                    Padding(
                      padding: EdgeInsets.only(
                        left: controller.screenSize.width * 0.06,
                        right: controller.screenSize.width * 0.06,
                      ),
                      child: TextFormField(
                        cursorColor: Colors.orange,
                        controller: model.gendertext,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          hintText: "Gender",
                          hintStyle: TextStyle(
                            fontSize: controller.screenSize.fieldtextsize,
                          ),
                          hintTextDirection: TextDirection.ltr,
                          filled: true,
                          fillColor: Colors.black12,
                          border: const OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(20)),
                          ),
                          prefixIcon: Icon(Icons.groups_3),
                        ),
                        textInputAction: TextInputAction.next,
                      ),
                    ),
                    SizedBox(height: controller.screenSize.height * 0.01),

                    // send button
                    ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor: WidgetStateProperty.all(
                          Colors.lightGreen,
                        ),
                        fixedSize: WidgetStateProperty.all(
                          Size(
                            controller.screenSize.height * 0.3,
                            controller.screenSize.height * 0.06,
                          ),
                        ),
                        shape: WidgetStateProperty.all(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                        ),
                        shadowColor: WidgetStateProperty.all(Colors.green),
                        elevation: WidgetStateProperty.all(5),
                      ),
                      onPressed: () async {},
                      child: Text(
                        "Send",
                        style: TextStyle(
                          fontSize: controller.screenSize.buttonfontsize,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    SizedBox(height: controller.screenSize.height * 0.01),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                  top: controller.screenSize.height * 0.025,
                  bottom: controller.screenSize.height * 0.025,
                ),
                child: Center(child: Text('Herd')),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor: WidgetStateProperty.all(
                        Colors.redAccent,
                      ),
                      fixedSize: WidgetStateProperty.all(
                        Size(
                          controller.screenSize.height * 0.12,
                          controller.screenSize.height * 0.06,
                        ),
                      ),
                      shape: WidgetStateProperty.all(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                      ),
                      shadowColor: WidgetStateProperty.all(Colors.red),
                      elevation: WidgetStateProperty.all(5),
                    ),
                    onPressed: () async {},
                    child: Text(
                      "Send",
                      style: TextStyle(
                        fontSize: controller.screenSize.buttonfontsize,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  SizedBox(width: controller.screenSize.width * 0.01),
                  SizedBox(
                    width: controller.screenSize.width * 0.12,
                    height: controller.screenSize.width * 0.1,
                    child: TextField(
                      cursorColor: Colors.orange,
                      controller: model.getyakslisttext,
                      keyboardType: TextInputType.name,
                      decoration: InputDecoration(
                        hintText: "Day",
                        hintTextDirection: TextDirection.ltr,
                        hintStyle: TextStyle(
                          fontSize: controller.screenSize.fieldtextsize,
                        ),
                        filled: true,
                        fillColor: Colors.black12,
                        border: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                        ),
                      ),
                      textInputAction: TextInputAction.next,
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  SizedBox(
                    width: controller.screenSize.width * 0.05,
                    height: controller.screenSize.height * 0.08,
                  ),

                  Text("Yaks List:"),
                ],
              ),
              SizedBox(
                width: controller.screenSize.width * 0.8,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [Text("Name"), Text("Age"), Text("Last Shaved")],
                ),
              ),

              Padding(
                padding: EdgeInsets.only(
                  top: controller.screenSize.height * 0.01,
                ),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Colors.blueGrey,
                  ),
                  width: controller.screenSize.width * 0.9,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text("yeti", style: TextStyle(color: Colors.white)),
                      Text("18", style: TextStyle(color: Colors.white)),
                      Text("6", style: TextStyle(color: Colors.white)),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
