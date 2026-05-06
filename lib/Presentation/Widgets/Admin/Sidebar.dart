// import 'package:democards/Presentation/widgets/Admin/Sidebarddownbtn.dart';
import 'package:flutter/material.dart';
import 'package:snappis/Core/constant/Imageconstant.dart';
import 'package:snappis/Presentation/Widgets/Admin/AdminPannel.dart';
import 'package:snappis/Presentation/Widgets/Admin/Sidebarddownbtn.dart';
// import 'package:siddhikimmigration/presentation/widget/admin/Sidedropdown.dart';

class Sidebar extends StatelessWidget {
  final bool collapsed;
  final VoidCallback onToggle;
  final ValueChanged<AdminPage> onSelect;


  const Sidebar({required this.collapsed, required this.onToggle, required this.onSelect,super.key});

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      width: collapsed ? 80 : 300,
      color: const Color(0xfff7f7f7),
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: IconButton(
                icon: const Icon(Icons.menu),
                onPressed: onToggle,
              ),
            ),
        

            sidebarItem(null, "Home",GamesImage.home,onTap:() => onSelect(AdminPage.homepage)),
              SidebarDropdownItem(
              isExpandedSidebar: collapsed,
              title: "App Setting",
              iconPath: GamesImage.users,
              children: [
                SidebarSubItem(
                  imageurl: GamesImage.brand,
                  title: "Category Instagram",
                  onTap: (){
                    onSelect(AdminPage.instagracategorylist);
                    print("mandeep");
                  } ,
                ),
                SidebarSubItem(
                  imageurl: GamesImage.creators,
                  title: "Banner",
                  onTap: () {
                    onSelect(AdminPage.creatoruser);
                    print("Creator");

                  },
                ),
               
                // SidebarSubItem(
                //   imageurl: "/Icons/reading.png",
                //   title: "Study Visa",
                //   onTap: () => onSelect(AdminPage.agentstudyVisa),
                // ),
              ],
            ),
             SidebarDropdownItem(
              isExpandedSidebar: collapsed,
              title: "Users",
              iconPath: GamesImage.users,
              children: [
                SidebarSubItem(
                  imageurl: GamesImage.brand,
                  title: "Brand",
                  onTap: (){
                    onSelect(AdminPage.branduser);
                    print("mandeep");
                  } ,
                ),
                SidebarSubItem(
                  imageurl: GamesImage.creators,
                  title: "Creator",
                  onTap: () {
                    onSelect(AdminPage.creatoruser);
                    print("Creator");

                  },
                ),
                SidebarSubItem(
                  imageurl: GamesImage.admin,
                  title: "Admin",
                  onTap: () {
                    onSelect(AdminPage.adminuser);
                    print("Creator");
                  },
                ),
                SidebarSubItem(
                  imageurl: GamesImage.staff,
                  title: "Employee's",
                  onTap: () {
                    onSelect(AdminPage.employeeuser);
                    print("Creator");
                  },
                ),
                SidebarSubItem(
                  imageurl: GamesImage.creators,
                  title: "Roles",
                  onTap: () {

                  },
                ),
                // SidebarSubItem(
                //   imageurl: "/Icons/reading.png",
                //   title: "Study Visa",
                //   onTap: () => onSelect(AdminPage.agentstudyVisa),
                // ),
              ],
            ),
             SidebarDropdownItem(
              isExpandedSidebar: collapsed,
              title: "Brand",
              iconPath: GamesImage.brand1,
              children: [
                SidebarSubItem(
                  imageurl: GamesImage.brand,
                  title: "Brand Users",
                  onTap: (){
                    // onSelect(AdminPage.bettingHistory);
                      onSelect(AdminPage.branduser);
                                        

                    print("mandeep");
                  } ,
                ),
                SidebarSubItem(
                  imageurl: GamesImage.brandservice,
                  title: "Brand Service",
                  onTap: () {
                      onSelect(AdminPage.brandsetting);
                    
                  },
                ),
                SidebarSubItem(
                  imageurl: GamesImage.brandcampaign,
                  title: "Brand Campaign",
                  onTap: () {
                        onSelect(AdminPage.brandcampaign);

                  },
                ),
                SidebarSubItem(
                  imageurl: GamesImage.brandearning,
                  title: "Brand Transaction",
                  onTap: () {
                     onSelect(AdminPage.brandtransaction);

                  },
                ),
                SidebarSubItem(
                  imageurl: GamesImage.brandearning,
                  title: "Brand Conversation",
                  onTap: () {
                    
                  },
                ),

              
                // SidebarSubItem(
                //   imageurl: "/Icons/reading.png",
                //   title: "Study Visa",
                //   onTap: () => onSelect(AdminPage.agentstudyVisa),
                // ),
              ],
            ),
             SidebarDropdownItem(
              isExpandedSidebar: collapsed,
              title: "Creators",
              iconPath: GamesImage.creators,
              children: [
                SidebarSubItem(
                  imageurl: GamesImage.brand,
                  title: "Creator Users",
                  onTap: (){
                    // onSelect(AdminPage.bettingHistory);
                                        onSelect(AdminPage.creatoruser);

                    print("mandeep");
                  } ,
                ),
                SidebarSubItem(
                  imageurl: GamesImage.brandservice,
                  title: "Creator Service",
                  onTap: () {
                      onSelect(AdminPage.creatorservicetracking);

                  },
                ),
                SidebarSubItem(
                  imageurl: GamesImage.brandcampaign,
                  title: "Creator Campaign",
                  onTap: () {
                      onSelect(AdminPage.creatorcampaigntracking);

                    
                  },
                ),
                SidebarSubItem(
                  imageurl: GamesImage.brandearning,
                  title: "Creator Earning",
                  onTap: () {
                    onSelect(AdminPage.creatoreacrning);

                  },
                ),
                SidebarSubItem(
                  imageurl: GamesImage.brandearning,
                  title: "Creator Conversation",
                  onTap: () {
                    
                  },
                ),
                // SidebarSubItem(
                //   imageurl: "/Icons/reading.png",
                //   title: "Study Visa",
                //   onTap: () => onSelect(AdminPage.agentstudyVisa),
                // ),
              ],
            ),
             SidebarDropdownItem(
              isExpandedSidebar: collapsed,
              title: "Task",
              iconPath: GamesImage.creators,
              children: [
                SidebarSubItem(
                  imageurl: GamesImage.brand,
                  title: "Existing Task",
                  onTap: (){
                    // onSelect(AdminPage.bettingHistory);
                    print("mandeep");
                  } ,
                ),
                SidebarSubItem(
                  imageurl: GamesImage.brandservice,
                  title: "Comments",
                  onTap: () {
                    
                  },
                ),
                SidebarSubItem(
                  imageurl: GamesImage.brandcampaign,
                  title: "Reviews",
                  onTap: () {
                    
                  },
                ),
                // SidebarSubItem(
                //   imageurl: "/Icons/reading.png",
                //   title: "Study Visa",
                //   onTap: () => onSelect(AdminPage.agentstudyVisa),
                // ),
              ],
            ),
            sidebarItem(null, "Communication",GamesImage.communi,onTap:() => onSelect(AdminPage.homepage)),
            sidebarItem(null, "Help and Support",GamesImage.support,onTap:() => onSelect(AdminPage.homepage)),

            SidebarDropdownItem(
              isExpandedSidebar: collapsed,
              title: "Setting",
              iconPath: GamesImage.creators,
              children: [
                SidebarSubItem(
                  imageurl: GamesImage.brand,
                  title: "System Setting",
                  onTap: (){
                    // onSelect(AdminPage.bettingHistory);
                      onSelect(AdminPage.systemsetting);
                    print("mandeep");
                  } ,
                ),
                SidebarSubItem(
                  imageurl: GamesImage.brandservice,
                  title: "Brand Setting",
                  onTap: () {
                      onSelect(AdminPage.brandsetting);
                  },
                ),
                SidebarSubItem(
                  imageurl: GamesImage.brandcampaign,
                  title: "Currency Setting",
                  onTap: () {
                      onSelect(AdminPage.currencysetting);
                  },
                ),
                SidebarSubItem(
                  imageurl: GamesImage.brandcampaign,
                  title: "Email Setting",
                  onTap: () {
                      onSelect(AdminPage.emailsetting);
                  },
                ),
                SidebarSubItem(
                  imageurl: GamesImage.brandcampaign,
                  title: "SMS Setting",
                  onTap: () {
                      onSelect(AdminPage.smssetting);
                  },
                ),
                SidebarSubItem(
                  imageurl: GamesImage.brandcampaign,
                  title: "Notification Setting",
                  onTap: () {
                      onSelect(AdminPage.notificationsetting);
                  },
                ),
                SidebarSubItem(
                  imageurl: GamesImage.brandcampaign,
                  title: "Payment Setting",
                  onTap: () {
                      onSelect(AdminPage.paymentsetting);
                  },
                ),
                // 9876543310
                SidebarSubItem(
                  imageurl: GamesImage.brandcampaign,
                  title: "App Setting",
                  onTap: () {
                      onSelect(AdminPage.paymentsetting);
                  },
                ),
                SidebarSubItem(
                  imageurl: GamesImage.brandcampaign,
                  title: "Notification Templates",
                  onTap: () {
                      onSelect(AdminPage.notificationtemplates);
                  },
                ),
                // SidebarSubItem(
                //   imageurl: "/Icons/reading.png",
                //   title: "Study Visa",
                //   onTap: () => onSelect(AdminPage.agentstudyVisa),
                // ),
              ],
            ),
            sidebarItem(null, "Privacy Policy",GamesImage.privacypolicy,onTap:() => onSelect(AdminPage.homepage)),
            sidebarItem(null, "Terms and Condition",GamesImage.termsandcondition,onTap:() => onSelect(AdminPage.homepage)),
            sidebarItem(null, "Refund Policy",GamesImage.home,onTap:() => onSelect(AdminPage.homepage)),

            // sidebarItem(null, "Wallet",GamesImage.wallet,onTap:() => onSelect(AdminPage.homepage)),
            // SidebarDropdownItem(
            //   isExpandedSidebar: collapsed,
            //   title: "Setting",
            //   iconPath: GamesImage.setting,
            //   children: [
            //     SidebarSubItem(
            //       imageurl: GamesImage.bettinghistory,
            //       title: "Basic Setting",
            //       onTap: (){
            //         onSelect(AdminPage.basicsetting);
            //         print("mandeep");
            //       } ,
            //     ),
            //     SidebarSubItem(
            //       imageurl: GamesImage.addbettting,
            //       title: "Mail Setting",
            //       onTap: () => onSelect(AdminPage.emailsetting),
            //     ),
            //     SidebarSubItem(
            //       imageurl: GamesImage.currencysetting,
            //       title: "Payment Setting",
            //       onTap: () => onSelect(AdminPage.currencysetup),
            //     ),
            //   ],
            // ),
            // sidebarItem(null, "Transaction",GamesImage.transaction,onTap:() => onSelect(AdminPage.support)),

            // sidebarItem(null, "Support",GamesImage.support,onTap:() => onSelect(AdminPage.support)),
            // sidebarItem(null, "Terms and Condition",GamesImage.privacypolicy,onTap:() => onSelect(AdminPage.terms)),
            // sidebarItem(null, "Privacy Policy",GamesImage.privacypolicy,onTap:() => onSelect(AdminPage.privacy)),
          ],
        ),
      ),
    );
  }

  // Widget sidebarItem(IconData icon, String title) {
  //   return ListTile(
  //     leading: Icon(icon),
  //     title: collapsed ? null : Text(title),
  //   );
  // }
  Widget sidebarItem(
  IconData? icon,
  String? title,
  String? iconPath,{
  VoidCallback? onTap,}

) {
  return ListTile(
    leading: icon != null? Icon(icon) :Image.asset(
            iconPath!,
            width: 24,
            height: 24,
            fit: BoxFit.contain,
          ),
    title: collapsed ? null : Text(title!),
    onTap: onTap,

  );
}
}
