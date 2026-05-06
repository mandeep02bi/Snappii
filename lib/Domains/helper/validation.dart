import 'package:get/get.dart';

bool isEmail(String value) {
  return GetUtils.isEmail(value);
}

bool isPhone(String value) {
  return GetUtils.isPhoneNumber(value);
}
