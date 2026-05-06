import 'package:snappis/Domains/Entities/Instagra_category.dart';


abstract class InstagramCategoryRepository {
  Future<List<InstagramCategory>> getCategories();

  Future<Map<String, dynamic>> addCategory(String categoryName);

}
