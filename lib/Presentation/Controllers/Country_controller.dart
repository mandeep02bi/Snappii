import 'package:get/get.dart';
import 'package:snappis/Data/Repositories/country_repository.dart';
import 'package:snappis/Data/models/country_code_model.dart';

class CountryController extends GetxController {
  final CountryRepository _repo = CountryRepository();

  final isLoading = false.obs;
  final countries = <CountryCodeModel>[].obs;
  final selectedCountry = Rxn<CountryCodeModel>();

  @override
  void onInit() {
    fetchCountries();
    super.onInit();
  }

  Future<void> fetchCountries() async {
    try {
      isLoading.value = true;
      final List<CountryCodeModel> data = await _repo.fetchCountryCodes();

      // final data = await _repo.fetchCountryCodes();
      countries.assignAll(data);

      selectedCountry.value =
          data.firstWhereOrNull((e) => e.isoCode == "IN") ?? data.first;

    } catch (e) {
      Get.snackbar("Error", e.toString());
    } finally {
      isLoading.value = false;
    }
  }
}

// class CountryController extends GetxController {
//   final CountryRepository _repo = CountryRepository();

//   final isLoading = false.obs;
//   final countries = <CountryCodeModel>[].obs;
//   // final selectedCountry = Rx<CountryCodeModel?>();
//   final selectedCountry = Rxn<CountryCodeModel>();


//   @override
//   void onInit() {
//     fetchCountries();
//     super.onInit();
//   }

//   Future<void> fetchCountries() async {
//     try {
//       isLoading.value = true;
//       final data = await _repo.fetchCountryCodes();
//       countries.assignAll(data);

//       // Default → India
//       // selectedCountry.value =
//       //     data.firstWhereOrNull((e) => e.isoCode == "IN") ?? data.first;
//       selectedCountry.value = data.firstWhereOrNull((e) => e.isoCode == "IN") ?? data.first;

//     } catch (e) {
//       Get.snackbar("Error", e.toString());
//     } finally {
//       isLoading.value = false;
//     }
//   }
// }
