abstract class InstagramCategoryEvent {}

class FetchInstagramCategories extends InstagramCategoryEvent {}

class RefreshInstagramCategories extends InstagramCategoryEvent {}

class AddInstagramCategory extends InstagramCategoryEvent {
  final String categoryName;

  AddInstagramCategory(this.categoryName);
}