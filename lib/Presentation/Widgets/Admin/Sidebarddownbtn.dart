import 'package:flutter/material.dart';

class SidebarDropdownItem extends StatefulWidget {
  final String title;
  final List<SidebarSubItem> children;
  final bool isExpandedSidebar;
  final String iconPath;


  const SidebarDropdownItem({
    super.key,
    required this.title,
    required this.children,
    this.isExpandedSidebar = true,
    required this.iconPath
  });

  @override
  State<SidebarDropdownItem> createState() => _SidebarDropdownItemState();
}

class _SidebarDropdownItemState extends State<SidebarDropdownItem>
    with SingleTickerProviderStateMixin {
  bool isOpen = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        /// MAIN ITEM
        InkWell(
          onTap: () {
            if (!widget.isExpandedSidebar)
            {
            setState(() => isOpen = !isOpen);
            }
          },
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
            child: Row(
              children: [
               Image.asset(
                  widget.iconPath,
                  width: 24,
                  height: 24,
                  fit: BoxFit.contain,
                ),
                if (!widget.isExpandedSidebar) ...[
                  const SizedBox(width: 14),
                  Expanded(
                    child: Text(
                      widget.title,
                      style: const TextStyle(fontSize: 15),
                    ),
                  ),
                  AnimatedRotation(
                    turns: isOpen ? 0.5 : 0,
                    duration: const Duration(milliseconds: 200),
                    child: const Icon(Icons.keyboard_arrow_down),
                  ),
                ],
              ],
            ),
          ),
        ),

        /// DROPDOWN
        AnimatedSize(
          duration: const Duration(milliseconds: 250),
          curve: Curves.easeInOut,
          child: isOpen && !widget.isExpandedSidebar
              ? Column(
                  children: widget.children
                      .map(
                        (e) => InkWell(
                          onTap: e.onTap,
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(56, 10, 16, 10),
                            child: Align(
                              alignment: Alignment.centerLeft,
                              child: Row(
                                children: [
                                  Image.asset(
                                    e.imageurl!,
                                    width: 24,
                                    height: 24,
                                    fit: BoxFit.contain,
                                  ),
                                  SizedBox(width: 8,),
                                  Expanded(
                                    child: Text(
                                      e.title,
                                      softWrap: false,
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                      style: const TextStyle(
                                        fontSize: 14,
                                        color: Colors.grey,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      )
                      .toList(),
                )
              : const SizedBox.shrink(),
        ),
      ],
    );
  }
}

class SidebarSubItem {
  final String title;
  final String? imageurl;
  final VoidCallback onTap;

  SidebarSubItem({
    required this.title,
    this.imageurl,
    required this.onTap,
  });
}
