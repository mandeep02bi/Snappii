import 'package:get/get.dart';
import 'package:snappis/Domains/controllers/BookingFormcontroller.dart';
import 'package:snappis/Domains/controllers/authcontroller.dart';
import 'package:snappis/Domains/controllers/currencycontrollersetting.dart';
import 'package:snappis/Presentation/Controllers/Country_controller.dart';

class AuthBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(AuthController(), permanent: true);
    Get.put(CountryController(), permanent: true);
    Get.put(CurrencySettingsController(), permanent: true);
    Get.lazyPut<BookingFormController>(
      () => BookingFormController(),
      fenix: true,
    );
    // Get.lazyPut(() => Dio());
    // Get.put(() => InstagramCategoryRemoteDataSource(Get.find()));
    // Get.put(() => InstagramCategoryRepositoryImpl(Get.find()));
    // Get.put(() => GetInstagramCategories(Get.find()));
    // Get.put(() => InstagramCategoryBloc(Get.find()));

    // Get.put<CurrencySettingsController>(
    //   () => CurrencySettingsController(),
    // );
  }
}
