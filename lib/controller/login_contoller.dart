import 'package:get/get.dart';
class LoginController extends GetxController{

  bool secure=true;
  void changesecure(){
    secure=!secure;
    update();
  }
}