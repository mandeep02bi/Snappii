import 'package:get/get.dart';

class CreatorDetailController extends GetxController {
  var creator = {}.obs;

  void setCreator(Map<String, dynamic> data) {
    print("Data ${data}");
    creator.value = data;

  }
}
