import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CampaignSelectionModal extends StatefulWidget {
  final String title;
  final String searchHint;
  final List<String> options;
  final ValueChanged<String> onSelected;

  const CampaignSelectionModal({
    super.key,
    required this.title,
    required this.searchHint,
    required this.options,
    required this.onSelected,
  });

  @override
  State<CampaignSelectionModal> createState() => _CampaignSelectionModalState();
}

class _CampaignSelectionModalState extends State<CampaignSelectionModal> {
  late List<String> filteredOptions;
  final TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    filteredOptions = widget.options;
  }

  void _filterList(String query) {
    setState(() {
      filteredOptions = widget.options
          .where((option) => option.toLowerCase().contains(query.toLowerCase()))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: const Color(0xFFEDEDED),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8.r),
        side: BorderSide(
          color: const Color(0xFFADACAE).withOpacity(0.42),
          width: 1.w,
        ),
      ),
      child: Container(
        width: 312.w,
        constraints: BoxConstraints(minHeight: 160.h, maxHeight: 400.h),
        padding: EdgeInsets.all(16.r),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  widget.title,
                  style: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w600,
                    color: const Color(0xFF4A4A4A),
                  ),
                ),
                GestureDetector(
                  onTap: () => Navigator.pop(context),
                  child: Container(
                    decoration: const BoxDecoration(
                      color: Color(0xFF626262),
                      shape: BoxShape.circle,
                    ),
                    padding: EdgeInsets.all(2.r),
                    child: Icon(
                      Icons.close,
                      color: Colors.white,
                      size: 16.r,
                    ),
                  ),
                ),
              ],
            ),
            Divider(height: 24.h, thickness: 1, color: const Color(0xFFD9D9D9)),
            TextField(
              controller: _searchController,
              onChanged: _filterList,
              style: TextStyle(fontSize: 13.sp, color: Colors.black87),
              decoration: InputDecoration(
                prefixIcon: Icon(
                  Icons.search,
                  color: const Color(0xFFADACAE),
                  size: 20.r,
                ),
                hintText: widget.searchHint,
                hintStyle: TextStyle(
                  color: const Color(0xFFADACAE),
                  fontSize: 13.sp,
                ),
                filled: true,
                fillColor: const Color(0xFFF1F1F1),
                contentPadding: EdgeInsets.symmetric(vertical: 8.h),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.r),
                  borderSide: BorderSide(color: Colors.black.withOpacity(0.1)),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.r),
                  borderSide: BorderSide(color: Colors.black.withOpacity(0.1)),
                ),
              ),
            ),
            SizedBox(height: 12.h),
            Flexible(
              child: ListView.separated(
                shrinkWrap: true,
                itemCount: filteredOptions.length,
                separatorBuilder: (_, __) =>
                    Divider(height: 1.h, color: const Color(0xFFD9D9D9)),
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      widget.onSelected(filteredOptions[index]);
                      Navigator.pop(context);
                    },
                    child: Padding(
                      padding: EdgeInsets.symmetric(vertical: 10.h),
                      child: Text(
                        filteredOptions[index],
                        style: TextStyle(
                          fontSize: 14.sp,
                          color: const Color(0xFF4A4A4A),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

void showCampaignSelection({
  required BuildContext context,
  required String title,
  required String searchHint,
  required List<String> options,
  required ValueChanged<String> onSelected,
}) {
  showDialog(
    context: context,
    builder: (context) => CampaignSelectionModal(
      title: title,
      searchHint: searchHint,
      options: options,
      onSelected: onSelected,
    ),
  );
}
