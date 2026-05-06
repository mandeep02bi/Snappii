import 'package:snappis/Domains/Repositores/Instagram_category_res.dart';

class AddInstagramCategoryUseCase {
  final InstagramCategoryRepository repository;

  AddInstagramCategoryUseCase(this.repository);

  Future<Map<String, dynamic>> call(String categoryName) {
    return repository.addCategory(categoryName);
  }
}

// class AddInstagramCategory {
//   final InstagramCategoryRepository repository;

//   AddInstagramCategory(this.repository);

//   Future<Map<String, dynamic>> call(String categoryName) {
//     return repository.addCategory(categoryName);
//   }
// }
