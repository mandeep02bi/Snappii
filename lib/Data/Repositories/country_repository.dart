import 'package:snappis/Core/Api/ApiServices.dart';
import 'package:snappis/Core/constant/Apiconstant.dart';
import '../Models/Country_code_model.dart';

// class CountryRepository {
//   Future<List<CountryCodeModel>> fetchCountryCodes() async {
//     final res = await ApiService.getAPI("/admin/country-phone-codes");

//     if (res["status"] != true) {
//       throw Exception(res["message"] ?? "Failed to load country codes");
//     }

//     final List list = res["data"]["data"] ?? [];

//     return list.map((e) => CountryCodeModel.fromJson(e)).toList();
//   }
// }

class CountryRepository {
  Future<List<CountryCodeModel>> fetchCountryCodes() async {
    final res = await ApiService.getAPI(ApiConstants.countryCodes);

    if (res["status"] != true) {
      throw Exception(res["message"] ?? "Failed to load country codes");
    }

    final List list = res["data"]["data"] ?? [];

    return list
        .map((e) => CountryCodeModel.fromJson(e))
        .toList();
  }
}
