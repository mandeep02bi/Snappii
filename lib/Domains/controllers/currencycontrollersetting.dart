import 'package:get/get.dart';

class CurrencySettingsController extends GetxController {

  var currencyCode = "INR".obs;
  var decimalPlaces = 2.obs;
  var symbolBefore = true.obs;
  var decimalSeparator = "dot".obs;
  var showDecimals = true.obs;
  var addSpace = false.obs;

  void setCurrency(String code) {
    currencyCode.value = code;
  }

  void setDecimals(int value) {
    decimalPlaces.value = value;
  }

  void toggleSymbolPosition(bool before) {
    symbolBefore.value = before;
  }

  void setDecimalSeparator(String value) {
    decimalSeparator.value = value;
  }

  void toggleShowDecimals(bool value) {
    showDecimals.value = value;
  }

  void toggleAddSpace(bool value) {
    addSpace.value = value;
  }
}
