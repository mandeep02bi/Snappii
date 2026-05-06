
import 'package:flutter/material.dart';
import 'package:snappis/Core/utils/Colors.dart';

class SidebarItem extends StatelessWidget {
  final IconData icon;
  final String title;
  final bool collapsed;
  final bool active;
  final VoidCallback? onTap;
  final bool isSubItem;
  final Widget? trailing;

  const SidebarItem({
    super.key,
    required this.icon,
    required this.title,
    required this.collapsed,
    required this.active,
    this.onTap,
    this.isSubItem = false,
    this.trailing,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12),
      child: Container(
        margin: EdgeInsets.symmetric(
          horizontal: isSubItem ? 12 : 12,
          vertical: 4,
        ),
        padding: EdgeInsets.symmetric(
          horizontal: isSubItem ? 12 : 16,
          vertical: isSubItem ? 10 : 14,
        ),
        decoration: BoxDecoration(
          color: active
              ? AppColors.sidebarActive.withOpacity(0.30)
              : Colors.transparent,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          children: [
            /// 🔹 LEFT INDICATOR FOR SUBITEM
            if (isSubItem)
              Container(
                width: 3,
                height: 22,
                margin: const EdgeInsets.only(right: 10),
                decoration: BoxDecoration(
                  color: active
                      ? AppColors.sidebarActive
                      : AppColors.sidebarText.withOpacity(0.4),
                  borderRadius: BorderRadius.circular(2),
                ),
              ),

            /// ICON
            Icon(
              icon,
              size: isSubItem ? 14 : 20, // ✅ bigger
              color: active
                  ? AppColors.sidebarActive
                  : Colors.white70, // ✅ visible
            ),

            if (!collapsed) ...[
              const SizedBox(width: 14),

              /// TITLE
              Expanded(
                child: Text(
                  title,
                  style: TextStyle(
                    color: active
                        ? Colors.white
                        : Colors.white70,
                    fontSize: isSubItem ? 13 : 14,
                    fontWeight:
                        isSubItem ? FontWeight.w400 : FontWeight.w500,
                  ),
                ),
              ),

              if (trailing != null) trailing!,
            ],
          ],
        ),
      ),
    );
  }
}



// import 'package:flutter/material.dart';
// import 'package:snappis/Core/utils/Colors.dart';

// class SidebarItem extends StatelessWidget {
//   final IconData icon;
//   final String title;
//   final bool collapsed;
//   final bool active;
//   final VoidCallback onTap;

//   final bool isSubItem;
//   final Widget? trailing;

//   const SidebarItem({
//     super.key,
//     required this.icon,
//     required this.title,
//     required this.collapsed,
//     required this.active,
//     required this.onTap,
//     this.isSubItem = false, // 👈 default false
//     this.trailing, // 👈 optional arrow / widget
//   });

//   @override
//   Widget build(BuildContext context) {
//     return InkWell(
//       onTap: onTap,
//       child: Container(
//         padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
//         decoration: BoxDecoration(
//           color: active ? Colors.transparent:AppColors.sidebarActive.withOpacity(0.15),
//           borderRadius: BorderRadius.circular(12),
//         ),
//         child: Row(
//           children: [
//             Icon(icon, color: AppColors.sidebarActive),
//             if (!collapsed) ...[
//               const SizedBox(width: 14),
//               Text(
//                 title,
//                 style: const TextStyle(color: AppColors.sidebarText),
//               ),
//             ],
//           ],
//         ),
//       ),
//     );
//   }
// }
