import 'package:snappis/Domains/Entities/Instagra_category.dart';
import 'package:snappis/Domains/Repositores/Instagram_category_res.dart';

class GetInstagramCategories {
  final InstagramCategoryRepository repository;

  GetInstagramCategories(this.repository);

  Future<List<InstagramCategory>> call() {
    return repository.getCategories();
  }
}
