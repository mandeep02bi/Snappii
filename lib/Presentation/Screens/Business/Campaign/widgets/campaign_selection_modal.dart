import 'package:flutter/material.dart';

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
        borderRadius: BorderRadius.circular(8),
        side: BorderSide(
          color: const Color(0xFFADACAE).withOpacity(0.42),
          width: 1,
        ),
      ),
      child: Container(
        width: 312,
        constraints: const BoxConstraints(minHeight: 160, maxHeight: 400),
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  widget.title,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: Color(0xFF4A4A4A),
                  ),
                ),
                GestureDetector(
                  onTap: () => Navigator.pop(context),
                  child: Container(
                    decoration: const BoxDecoration(
                      color: Color(0xFF626262),
                      shape: BoxShape.circle,
                    ),
                    padding: const EdgeInsets.all(2),
                    child: const Icon(
                      Icons.close,
                      color: Colors.white,
                      size: 16,
                    ),
                  ),
                ),
              ],
            ),
            const Divider(height: 24, thickness: 1, color: Color(0xFFD9D9D9)),
            TextField(
              controller: _searchController,
              onChanged: _filterList,
              decoration: InputDecoration(
                prefixIcon: const Icon(
                  Icons.search,
                  color: Color(0xFFADACAE),
                  size: 20,
                ),
                hintText: widget.searchHint,
                hintStyle: const TextStyle(
                  color: Color(0xFFADACAE),
                  fontSize: 13,
                ),
                filled: true,
                fillColor: const Color(0xFFF1F1F1),
                contentPadding: const EdgeInsets.symmetric(vertical: 8),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(color: Colors.black.withOpacity(0.1)),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(color: Colors.black.withOpacity(0.1)),
                ),
              ),
            ),
            const SizedBox(height: 12),
            Flexible(
              child: ListView.separated(
                shrinkWrap: true,
                itemCount: filteredOptions.length,
                separatorBuilder: (_, __) =>
                    const Divider(height: 1, color: Color(0xFFD9D9D9)),
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      widget.onSelected(filteredOptions[index]);
                      Navigator.pop(context);
                    },
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10.0),
                      child: Text(
                        filteredOptions[index],
                        style: const TextStyle(
                          fontSize: 14,
                          color: Color(0xFF4A4A4A),
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
