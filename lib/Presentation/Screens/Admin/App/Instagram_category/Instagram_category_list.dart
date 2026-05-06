import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:snappis/Presentation/Screens/Admin/App/Instagram_category/categoryDatasource.dart';
import 'package:snappis/Presentation/bloc/category/insta_cat_bloc.dart';
import 'package:snappis/Presentation/bloc/category/insta_cat_state.dart';
import 'package:snappis/Presentation/bloc/category/instagramcategoryevent.dart';

class InstagramCategoryList extends StatefulWidget {
  const InstagramCategoryList({super.key});

  @override
  State<InstagramCategoryList> createState() => _InstagramCategoryListState();
}

class _InstagramCategoryListState extends State<InstagramCategoryList> {
  
  @override
  Widget build(BuildContext context) {
    //     if (!Get.isRegistered<InstagramCategoryBloc>()) {
    //   Get.put(InstagramCategoryBloc(Get.find()));
    // }

    return BlocListener<InstagramCategoryBloc, InstagramCategoryState>(
            listener: (context, state) {

              if (state is InstagramCategoryActionSuccess) {
                Get.snackbar(
                  "Success",
                  state.message,
                  backgroundColor: Colors.green,
                  colorText: Colors.white,
                );
              }

              if (state is InstagramCategoryError) {
                Get.snackbar(
                  "Error",
                  state.message,
                  backgroundColor: Colors.red,
                  colorText: Colors.white,
                );
              }
            },
      child: Scaffold(
        backgroundColor: const Color(0xFFF9FAFB),
        body: RefreshIndicator(
          onRefresh: () async {
            context
                .read<InstagramCategoryBloc>()
                .add(RefreshInstagramCategories());
          },
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
          
                // /// TITLE
                // const Text(
                //   "Instagram Categories",
                //   style: TextStyle(
                //       fontSize: 24, fontWeight: FontWeight.bold),
                // ),
                _header(context),
          
                const SizedBox(height: 20),
          
                /// TABLE
                Expanded(
                  child: BlocBuilder<InstagramCategoryBloc,
                      InstagramCategoryState>(
                    builder: (context, state) {
                      if (state is InstagramCategoryLoading) {
                        return const Center(
                            child: CircularProgressIndicator());
                      }
          
                      if (state is InstagramCategoryLoaded) {
                        return SingleChildScrollView(child: _buildTable(state.categories));
                      }
          
                      return const SizedBox();
                    },
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTable(List categories) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: PaginatedDataTable(
        columnSpacing: 160,
        rowsPerPage: categories.length,
        showCheckboxColumn: false,
        columns: const [
          DataColumn(label: Text("Sr.no",style: TextStyle(fontWeight: FontWeight.bold),)),
          DataColumn(label: Text("Name",style: TextStyle(fontWeight: FontWeight.bold),)),
          DataColumn(label: Text("Abbreviation",style: TextStyle(fontWeight: FontWeight.bold),)),
          DataColumn(label: Text("Actions",style: TextStyle(fontWeight: FontWeight.bold),)),
        ],
        source: CategoryDataSource(categories),
      ),
    );
  }
  Widget _header(BuildContext context) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      /// LEFT SIDE TITLE
      const Text(
        "Instagram Categories",
        style: TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.bold,
        ),
      ),

      /// RIGHT SIDE BUTTONS
      Row(
        children: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: () {
              print("Ramesh");
              context
                  .read<InstagramCategoryBloc>()
                  .add(RefreshInstagramCategories());
            },
          ),
          /// 👁 BULK UPLOAD BUTTON
          OutlinedButton.icon(
            style: OutlinedButton.styleFrom(
              padding: const EdgeInsets.symmetric(
                  horizontal: 18, vertical: 14),
              side: const BorderSide(color: Color(0xFFE5E7EB)),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            onPressed: () {
              print("Bulk Upload Clicked");
            },
            icon: const Icon(Icons.remove_red_eye,
                color: Colors.grey),
            label: const Text(
              "Bulk Upload",
              style: TextStyle(color: Colors.black87),
            ),
          ),

          const SizedBox(width: 12),

          /// ➕ ADD CATEGORY BUTTON
          ElevatedButton.icon(
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFF10B981),
              padding: const EdgeInsets.symmetric(
                  horizontal: 20, vertical: 14),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            onPressed: () {
                _showAddCategoryDialog(context);
              print("Add Category Clicked");
            },
            icon: const Icon(Icons.add, color: Colors.white),
            label: const Text(
              "Add Category",
              style: TextStyle(color: Colors.white),
            ),
          ),
        ],
      )
    ],
  );
}

void _showAddCategoryDialog(BuildContext context) {
  final TextEditingController controller = TextEditingController();

  showDialog(
    context: context,
    barrierDismissible: false,
    builder: (dialogContext) {
      return AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        title: const Text(
          "Add New Category",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        content: SizedBox(
          width: 400,
          child: TextField(
            controller: controller,
            decoration: InputDecoration(
              hintText: "Category Name",
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(dialogContext),
            child: const Text("Cancel"),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFF10B981),
            ),
            onPressed: () {
              if (controller.text.trim().isEmpty) {
                Get.snackbar("Error", "Category name is required",
                    backgroundColor: Colors.red,
                    colorText: Colors.white);
                return;
              }

              context.read<InstagramCategoryBloc>().add(
                    AddInstagramCategory(controller.text.trim()),
                  );

              Navigator.pop(dialogContext);
            },
            child: const Text("Save"),
          )
        ],
      );
    },
  );
}


}