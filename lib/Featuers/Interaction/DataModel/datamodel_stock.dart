import 'package:get/get_rx/get_rx.dart';

class ServiceStok {
  RxString milk = "0".obs;
  RxString skins = "0".obs;

  ServiceStok({required Map amount}) {
    milk.value = amount['milk'].toString();
    skins.value = amount['skins'].toString();
  }
}
