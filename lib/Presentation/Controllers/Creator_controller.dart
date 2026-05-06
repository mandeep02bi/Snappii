import 'package:get/get.dart';
import 'package:snappis/Core/Api/ApiServices.dart';
import 'package:snappis/Core/constant/Apiconstant.dart';
import 'package:snappis/Data/Models/Creator_insta_model.dart';
import 'package:snappis/Domains/controllers/authcontroller.dart';

class CreatorController extends GetxController {

  /// ===============================
  /// TEXT FIELDS
  /// ===============================
  var name = ''.obs;
  var storyPrice = ''.obs;
  var reelPrice = ''.obs;
  var postPrice = ''.obs;
  var deadline = ''.obs;

  /// ===============================
  /// LOADING STATES
  /// ===============================
  var isGenderLoading = false.obs;
  var isCategoryLoading = false.obs;
  var isProfileSubmitting = false.obs;

  /// ===============================
  /// GENDER
  /// ===============================
  var genderList = <DropdownModel>[].obs;
  var selectedGender = Rxn<DropdownModel>();

  /// ===============================
  /// CATEGORY
  /// ===============================
  var categoryList = <DropdownModel>[].obs;
  var selectedCategory = Rxn<DropdownModel>();
    var selectedCategory2 = ''.obs;


  var creators = <CreatorInstaModel>[].obs;
  var categories = <String>[].obs;


  /// ===============================
  /// GET IDS
  /// ===============================
  int? get genderId => selectedGender.value?.id;
  int? get categoryId => selectedCategory.value?.id;

  @override
  void onInit() {
    fetchGenders();
    fetchCategories();
    super.onInit();
  }

  /// ============================================================
  /// FETCH INSTAGRAM CATEGORIES API
  /// GET: /api/instagram-categories
  /// ============================================================
  Future<void> fetchCategories() async {
    try {
      isCategoryLoading.value = true;

      final response = await ApiService.getAPI(
        ApiConstants.getcategories,
      );

      if (response["status"] == true) {
        final List data = response["data"]["data"];

        categoryList.value = data.map((item) {
          return DropdownModel(
            id: item["id"],
            name: item["category_name"],
          );
        }).toList();
      } else {
        Get.snackbar("Error", response["message"] ?? "Failed to load categories");
      }
    } catch (e) {
      Get.snackbar("Error", "Something went wrong");
    } finally {
      isCategoryLoading.value = false;
    }
  }

  /// ============================================================
  /// FETCH GENDERS API
  /// GET: /api/admin/genders/list
  /// ============================================================
  Future<void> fetchGenders() async {
    try {
      isGenderLoading.value = true;

      final response = await ApiService.getAPI(
        ApiConstants.getgender,
      );

      if (response["status"] == true) {
        final List data = response["data"]["data"];

        genderList.value = data.map((item) {
          return DropdownModel(
            id: item["id"],
            name: item["name"],
          );
        }).toList();
      } else {
        Get.snackbar("Error", response["message"] ?? "Failed to load genders");
      }
    } catch (e) {
      Get.snackbar("Error", "Something went wrong");
    } finally {
      isGenderLoading.value = false;
    }
  }
  void setCreators(List<CreatorInstaModel> list) {
    creators.value = list;

    // Extract unique categories
    final uniqueCategories = list.map((e) => e.categoryName).toSet().toList();

    categories.value = uniqueCategories;

    if (uniqueCategories.isNotEmpty) {
      selectedCategory2.value = uniqueCategories.first;
    }
  }

  List<CreatorInstaModel> get filteredCreators {
  if (selectedCategory2.value.isEmpty) {
    return creators;
  }

  return creators
      .where((c) => c.categoryName == selectedCategory2.value)
      .toList();
}

  /// ============================================================
  /// SUBMIT CREATOR PROFILE
  /// POST: /api/creator/profile
  /// ============================================================
  Future<bool> submitCreatorProfile() async {
    try {
      final authController = Get.find<AuthController>();

      if (categoryId == null || genderId == null) {
        Get.snackbar("Validation", "Please select category and gender");
        return false;
      }

      isProfileSubmitting.value = true;

      final payload = {
        "user_id": authController.userId.value, // replace with dynamic user id
        "category_id": categoryId,
        "reels_price": int.tryParse(reelPrice.value) ?? 0,
        "story_price": int.tryParse(storyPrice.value) ?? 0,
        "post_price": int.tryParse(postPrice.value) ?? 0,
        "gender_id": genderId,
        "delivery_days": int.tryParse(deadline.value) ?? 0,
      };

      final response = await ApiService.postAPI(
        ApiConstants.creatorprofile,
        payload,
      );

      if (response["status"] == true) {
        Get.snackbar("Success", "Profile saved successfully");
        return true;
      } else {
        Get.snackbar("Error", response["message"] ?? "Failed to save profile");
        return false;
      }
    } catch (e) {
      Get.snackbar("Error", "Something went wrong");
      return false;
    } finally {
      isProfileSubmitting.value = false;
    }
  }
}

class DropdownModel {
  final int id;
  final String name;

  DropdownModel({required this.id, required this.name});
}

// import 'package:get/get.dart';

// class CreatorController extends GetxController {

//   /// Text fields
//   var name = ''.obs;
//   // var category = ''.obs;
//   var storyPrice = ''.obs;
//   var reelPrice = ''.obs;
//   var postPrice = ''.obs;
//   var deadline = ''.obs;


//   /// Gender
//   var genderList = <DropdownModel>[].obs;
//   var selectedGender = Rxn<DropdownModel>();


//   // Category
//     var categoryList = <DropdownModel>[].obs;
//     var selectedCategory = Rxn<DropdownModel>();




//   /// Store gender ID only
//   int? get genderId => selectedGender.value?.id;
//   int? get categoryId => selectedCategory.value?.id;

//   void onInit() {
//     fetchGenders();
//     fetchCategories();
//     super.onInit();
//   }

//   /// Fetch gender from API
//   Future<void> fetchGenders() async {
//     await Future.delayed(const Duration(seconds: 1));

//     genderList.value = [
//       DropdownModel(id: 1, name: "Male"),
//       DropdownModel(id: 2, name: "Female"),
//       DropdownModel(id: 3, name: "Other"),
//     ];
//   }

//  Future<void> fetchCategories() async {
//     await Future.delayed(const Duration(seconds: 1));

//     categoryList.value = [
//       DropdownModel(id: 10, name: "Lifestyle"),
//       DropdownModel(id: 11, name: "Fitness"),
//       DropdownModel(id: 12, name: "Tech"),
//     ];
//   }
//   /// Prepare final payload
//   Map<String, dynamic> get creatorPayload => {
//         "name": name.value,
//         "category": categoryId,
//         "story_price": storyPrice.value,
//         "reel_price": reelPrice.value,
//         "post_price": postPrice.value,
//         "gender_id": genderId,
//         "deadline": deadline.value,
//       };
// }

// class DropdownModel {
//   final int id;
//   final String name;

//   DropdownModel({required this.id, required this.name});
// }
