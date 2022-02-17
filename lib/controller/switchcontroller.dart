import 'package:get/get.dart';
class SwitchX extends GetxController {
  RxBool on = false.obs; // our observable

  // swap true/false & save it to observable
  void toggle() => on.value = on.value ? false : true;
}