import 'package:snappis/Core/Api/ApiServices.dart';
import 'package:snappis/Core/constant/Apiconstant.dart';
import 'package:snappis/Data/DataSources/Instagram_category_data.dart';
import 'package:snappis/Domains/Entities/Instagra_category.dart';
import 'package:snappis/Domains/Repositores/Instagram_category_res.dart';

class InstagramCategoryRepositoryImpl
    implements InstagramCategoryRepository {

  final InstagramCategoryRemoteDataSource remote;

  InstagramCategoryRepositoryImpl(this.remote);

  @override
  Future<List<InstagramCategory>> getCategories() {
    return remote.getCategories();
  }

  @override
  Future<Map<String, dynamic>> addCategory(String categoryName) async {
    final response = await ApiService.postAPI(
      ApiConstants.addcategories,
      {
        "category_name": categoryName,
      },
    );

    return response;
  }
}
