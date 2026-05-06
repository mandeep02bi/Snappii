import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:snappis/Domains/Repositores/Usecases/addinstagramcategories.dart';
import 'package:snappis/Domains/Repositores/Usecases/getInstagramcategories.dart';
import 'package:snappis/Presentation/bloc/category/insta_cat_state.dart';
import 'package:snappis/Presentation/bloc/category/instagramcategoryevent.dart';


class InstagramCategoryBloc
    extends Bloc<InstagramCategoryEvent, InstagramCategoryState> {

  final GetInstagramCategories getCategories;
  final AddInstagramCategoryUseCase addCategory;


  InstagramCategoryBloc(this.getCategories,this.addCategory,)
      : super(InstagramCategoryInitial()) {

    on<FetchInstagramCategories>((event, emit) async {
      emit(InstagramCategoryLoading());

      try {
        final result = await getCategories();
        emit(InstagramCategoryLoaded(result));
      } catch (e) {
        emit(InstagramCategoryError(e.toString()));
      }
    });
   

    on<RefreshInstagramCategories>((event, emit) async {
      try {
        print("mandeep");
        final categories = await getCategories();
        emit(InstagramCategoryLoaded(categories));
      } catch (e) {
        emit(InstagramCategoryError("Refresh failed"));
      }
    });

    on<AddInstagramCategory>((event, emit) async {
    emit(InstagramCategoryLoading());

    try {
      final response =
          await addCategory(event.categoryName);

      if (response['status'] == true) {
        emit(InstagramCategoryActionSuccess(
            response['data']['message'] ??
                "Category added successfully"));

        final categories = await getCategories();
        emit(InstagramCategoryLoaded(categories));
      } else {
        emit(InstagramCategoryError(
            response['message'] ?? "Something went wrong"));
      }
    } catch (e) {
      emit(InstagramCategoryError(e.toString()));
    }
  });


  }

  
}
