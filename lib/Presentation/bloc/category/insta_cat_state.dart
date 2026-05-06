import 'package:snappis/Domains/Entities/Instagra_category.dart';


abstract class InstagramCategoryState {}

class InstagramCategoryInitial extends InstagramCategoryState {}

class InstagramCategoryLoading extends InstagramCategoryState {}

class InstagramCategoryLoaded extends InstagramCategoryState {
  final List<InstagramCategory> categories;
  InstagramCategoryLoaded(this.categories);
}

class InstagramCategoryError extends InstagramCategoryState {
  final String message;
  InstagramCategoryError(this.message);
}

class InstagramCategoryActionSuccess extends InstagramCategoryState {
  final String message;

  InstagramCategoryActionSuccess(this.message);
}