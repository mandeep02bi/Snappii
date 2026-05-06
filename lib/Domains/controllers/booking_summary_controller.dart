import 'package:get/get.dart';
import 'package:snappis/Domains/Entities/ServiceEntities.dart';

class BookingSummaryController extends GetxController {

  var subtotal = 0.obs;
  var totalItems = 0.obs;

  void updateSummary(List<ServiceEntity1> services) {
    subtotal.value =
        services.fold(0, (sum, s) => sum + (s.price * s.quantity));

    totalItems.value =
        services.fold(0, (sum, s) => sum + s.quantity);
  }
}