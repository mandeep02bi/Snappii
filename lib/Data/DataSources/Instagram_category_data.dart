import 'package:snappis/Core/Api/ApiServices.dart';
import 'package:snappis/Core/constant/Apiconstant.dart';
import 'package:snappis/Data/Models/instagram_category_model.dart';

class InstagramCategoryRemoteDataSource {

  final ApiService apiService;

  InstagramCategoryRemoteDataSource(this.apiService);

  Future<List<InstagramCategoryModel>> getCategories() async {

    final response =
        await ApiService.getAPI(ApiConstants.categories);

    if (response["status"] == true) {
      final List data = response["data"]["data"];

      return data
          .map((e) => InstagramCategoryModel.fromJson(e))
          .toList();
    } else {
      throw Exception(response["message"]);
    }
  }
}