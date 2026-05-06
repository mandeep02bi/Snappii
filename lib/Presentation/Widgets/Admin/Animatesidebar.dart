import 'package:flutter/material.dart';
import 'package:snappis/Core/utils/Colors.dart';
import 'package:snappis/Presentation/Widgets/Admin/Sidebaritem.dart';

class AnimatedSidebar extends StatelessWidget {
  final bool collapsed;
  final ValueChanged<bool> onToggle;
  final int selectedIndex;
  final ValueChanged<int> onSelect;
  final int? expandedMenu;
  final ValueChanged<int>? onExpand;

  const AnimatedSidebar({
    super.key,
    required this.collapsed,
    required this.onToggle,
    required this.selectedIndex,
    required this.onSelect,
    this.expandedMenu,
    this.onExpand,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
      width: collapsed ? 80 : 260,
      decoration: const BoxDecoration(
        color: AppColors.sidebarBg,
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(30),
          bottomRight: Radius.circular(30),
        ),
      ),
      child: Column(
        children: [
          const SizedBox(height: 20),

          /// 🔝 PROFILE (FIXED)
          CircleAvatar(
            radius: collapsed ? 18 : 28,
            backgroundColor: AppColors.sidebarActive,
            child: const Icon(Icons.person),
          ),

          if (!collapsed) ...[
            const SizedBox(height: 8),
            const Text("Alex Johnson",
                style: TextStyle(color: Colors.white)),
            const Text("alex@gmail.com",
                style: TextStyle(color: Colors.white60, fontSize: 12)),
          ],

          const SizedBox(height: 20),

          /// 🔽 SCROLLABLE MENU AREA
          Expanded(
            child: ListView(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              children: [
                SidebarItem(
                  icon: Icons.dashboard,
                  title: "Dashboard",
                  collapsed: collapsed,
                  active: selectedIndex == 0,
                  onTap: () => onSelect(0),
                ),

                SidebarItem(
                  icon: Icons.flight,
                  title: "User",
                  collapsed: collapsed,
                  active: selectedIndex == 9,
                  onTap: () => onSelect(9),
                ),

                /// BRAND (WITH SUB MENU)
                SidebarItem(
                  icon: Icons.flight,
                  title: "Brand",
                  collapsed: collapsed,
                  active: selectedIndex == 1 || expandedMenu == 1,
                  trailing: !collapsed
                      ? Icon(
                          expandedMenu == 1
                              ? Icons.keyboard_arrow_up
                              : Icons.keyboard_arrow_down,
                          color: Colors.white,
                        )
                      : null,
                  onTap: () => onExpand?.call(1),
                ),

                if (!collapsed && expandedMenu == 1) ...[
                  _subItem("Brand List", 101),
                  _subItem("Add Brand", 102),
                  _subItem("Brand Users", 103),
                ],

                SidebarItem(
                  icon: Icons.wallet,
                  title: "Creator",
                  collapsed: collapsed,
                  active: selectedIndex == 2,
                  onTap: () => onSelect(2),
                ),

                SidebarItem(
                  icon: Icons.bar_chart,
                  title: "Location",
                  collapsed: collapsed,
                  active: selectedIndex == 3,
                  onTap: () => onSelect(3),
                ),

                SidebarItem(
                  icon: Icons.bar_chart,
                  title: "Category",
                  collapsed: collapsed,
                  active: selectedIndex == 6,
                  onTap: () => onSelect(6),
                ),

                SidebarItem(
                  icon: Icons.bar_chart,
                  title: "Rate Setting",
                  collapsed: collapsed,
                  active: selectedIndex == 7,
                  onTap: () => onSelect(7),
                ),
              ],
            ),
          ),

          /// 🔻 FOOTER (FIXED)
          IconButton(
            icon: Icon(
              collapsed ? Icons.arrow_forward_ios : Icons.arrow_back_ios,
              color: Colors.white,
            ),
            onPressed: () => onToggle(!collapsed),
          ),

          const SizedBox(height: 16),
        ],
      ),
    );
  }

  /// 🔹 SUB MENU ITEM
 Widget _subItem(String title, int index) {
  return Padding(
    padding: const EdgeInsets.only(left: 24), // 🔹 better indentation
    child: SidebarItem(
      icon: Icons.circle_outlined, // ✅ better icon
      title: title,
      collapsed: false,
      isSubItem: true,
      active: selectedIndex == index,
      onTap: () => onSelect(index),
    ),
  );
}

}
