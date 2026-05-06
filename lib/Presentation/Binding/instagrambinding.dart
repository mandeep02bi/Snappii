import 'package:get/get.dart';
import 'package:snappis/Core/Api/ApiServices.dart';
import 'package:snappis/Data/DataSources/Instagram_category_data.dart';
import 'package:snappis/Domains/Repositores/Instagram_category_res.dart';
import 'package:snappis/Domains/Repositores/Usecases/addinstagramcategories.dart';
import 'package:snappis/Domains/Repositores/Usecases/getInstagramcategories.dart';
import 'package:snappis/Domains/Repositores/instagram_category_res_impl.dart';
import 'package:snappis/Presentation/bloc/category/insta_cat_bloc.dart';

class InstagramCategoryBinding extends Bindings {
  @override
  void dependencies() {
    // Get.lazyPut(() => InstagramCategoryRemoteDataSource(Get.find()));
    // Get.put(() => InstagramCategoryRepositoryImpl(Get.find()));
    // Get.put(() => GetInstagramCategories(Get.find()));
    // Get.lazyPut(() => InstagramCategoryBloc(Get.find()));
  //     Get.put(InstagramCategoryRemoteDataSource(Get.find()));
  // Get.put(InstagramCategoryRepositoryImpl(Get.find()));
  // Get.put(GetInstagramCategories(Get.find()));
  // Get.put(InstagramCategoryBloc(Get.find()), permanent: true);
    //   Get.lazyPut(() => InstagramCategoryRemoteDataSource(Get.find()));
    // // Get.lazyPut(() => InstagramCategoryRepositoryImpl(Get.find()));
    // Get.lazyPut<InstagramCategoryRepository>(
    //   () => InstagramCategoryRepositoryImpl(Get.find()),
    // );

    // Get.lazyPut(() => GetInstagramCategories(Get.find()));
    // Get.lazyPut(() => InstagramCategoryBloc(Get.find()));

    Get.lazyPut<ApiService>(() => ApiService());

    Get.lazyPut<InstagramCategoryRemoteDataSource>(
      () => InstagramCategoryRemoteDataSource(Get.find()),
    );

    Get.lazyPut<InstagramCategoryRepository>(
      () => InstagramCategoryRepositoryImpl(Get.find()),
    );

    Get.lazyPut<GetInstagramCategories>(
      () => GetInstagramCategories(Get.find()),
    );

      Get.lazyPut(() => AddInstagramCategoryUseCase(
          Get.find<InstagramCategoryRepository>(),
        ));


    // Get.lazyPut<InstagramCategoryBloc>(
    //   () => InstagramCategoryBloc(Get.find()),
    // );

       Get.lazyPut(() => InstagramCategoryBloc(
          Get.find<GetInstagramCategories>(),
          Get.find<AddInstagramCategoryUseCase>(),
        ));
  }
}
