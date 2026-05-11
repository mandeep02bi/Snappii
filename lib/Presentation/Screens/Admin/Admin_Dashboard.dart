// import 'package:flame/extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:snappis/Presentation/Binding/instagrambinding.dart';
import 'package:snappis/Presentation/Screens/Admin/App/Instagram_category/Instagram_category_list.dart';
import 'package:snappis/Presentation/Screens/Admin/Brands/BrandTransaction.dart';
import 'package:snappis/Presentation/Screens/Admin/Brands/Campaign/Brandcampaign.dart';
import 'package:snappis/Presentation/Screens/Admin/Brands/Campaign/BrandwiseCampaignlist.dart';
import 'package:snappis/Presentation/Screens/Admin/Brands/Campaign/CampaignDetails.dart';
import 'package:snappis/Presentation/Screens/Admin/Creator/Campaign/CreatorCampaignTracking.dart';
import 'package:snappis/Presentation/Screens/Admin/Creator/Creatorearning.dart';
import 'package:snappis/Presentation/Screens/Admin/Creator/Service/CreatorserviceTracking.dart';
// import 'package:snappis/Presentation/Screens/Admin/Deliver/DelieverymainSC.dart';
import 'package:snappis/Presentation/Screens/Admin/Homepage/Admin_homeSC.dart';
import 'package:snappis/Presentation/Screens/Admin/Setting/AppSetting.dart';
import 'package:snappis/Presentation/Screens/Admin/Setting/BrandSetting.dart';
import 'package:snappis/Presentation/Screens/Admin/Setting/CurrencySetting.dart';
import 'package:snappis/Presentation/Screens/Admin/Setting/Emailsetting.dart';
import 'package:snappis/Presentation/Screens/Admin/Setting/Notificationsetting.dart';
import 'package:snappis/Presentation/Screens/Admin/Setting/Notificationtemplate.dart';
import 'package:snappis/Presentation/Screens/Admin/Setting/Systemsetting.dart';
import 'package:snappis/Presentation/Screens/Admin/Setting/paymentsetting.dart';
import 'package:snappis/Presentation/Screens/Admin/Setting/smssetting.dart';
import 'package:snappis/Presentation/Screens/Admin/User/Branduserlog.dart';
import 'package:snappis/Presentation/Screens/Admin/User/Employeeuser.dart';
import 'package:snappis/Presentation/Screens/Admin/User/Employeeuserlog.dart';
import 'package:snappis/Presentation/Screens/Admin/User/adminuser.dart';
import 'package:snappis/Presentation/Screens/Admin/User/adminuserlog.dart';
import 'package:snappis/Presentation/Screens/Admin/User/brand.dart';
import 'package:snappis/Presentation/Screens/Admin/User/creators.dart';
import 'package:snappis/Presentation/Widgets/Admin/AdminPannel.dart';
import 'package:snappis/Presentation/Widgets/Admin/Admin_header.dart';
import 'package:snappis/Presentation/Widgets/Admin/Sidebar.dart';
import 'package:snappis/Presentation/bloc/category/insta_cat_bloc.dart';
import 'package:snappis/Presentation/bloc/category/instagramcategoryevent.dart';


class Admindashboard extends StatefulWidget {
  const Admindashboard({super.key});

  @override
  State<Admindashboard> createState() => _AdmindashboardState();
}

class _AdmindashboardState extends State<Admindashboard> {
 bool isCollapsed = false;
AdminPage selectedPage = AdminPage.homepage;

 Widget _buildContent() {
    switch (selectedPage) {
  
      case AdminPage.homepage:
        return AdminHomesc();
      case AdminPage.branduser:
        return MembersPage(
          onUserLogs: () {
            setState(() => selectedPage = AdminPage.userlogs);
          },
        );
      case AdminPage.userlogs:
        return const Branduserlog();
      case AdminPage.creatoruser:
        return Creators(
          onUserLogs: () {
            setState(() => selectedPage = AdminPage.creatoruserlog);
          },
        );
      case AdminPage.creatoruserlog:
        return const Branduserlog();
      case AdminPage.adminuser:
        return Adminuser(
          onUserLogs: () {
            setState(() => selectedPage = AdminPage.adminuserlog);
          },
        );
      case AdminPage.adminuserlog:
        return const Adminuserlog();
      case AdminPage.employeeuser:
        return Employeeuser(
          onUserLogs: () {
            setState(() => selectedPage = AdminPage.employeeuserlog);
          },
        );
      case AdminPage.employeeuserlog:
        return const Employeeuserlog();

      case AdminPage.emailsetting:
        return const Emailsetting();
      
      case AdminPage.systemsetting:
        return const Systemsetting();
      
      case AdminPage.smssetting:
        return const Smssetting();
      
      case AdminPage.paymentsetting:
        return const Paymentsettingt8();
      
      case AdminPage.notificationtemplates:
        return const Notificationtemplate();
      
      case AdminPage.notificationsetting:
        return const Notificationsetting();

      case AdminPage.currencysetting:
        return const Currencysetting();

      case AdminPage.brandsetting:
        return const Brandsetting();
      
      case AdminPage.appsetting:
        return const AppSetting();

      case AdminPage.brandtransaction:
        return const Brandtransaction();

      case AdminPage.brandcampaign:
          return Brandcampaign(
            onNavigate: (page) {
              setState(() {
                selectedPage = page;
              });
            },
          );
      
      case AdminPage.brandwisecampaignlist:
        return Brandwisecampaignlist(
          onNavigate: (page) {
            setState(() {
              selectedPage = page;
            });
          },
        );

      case AdminPage.campaigndetails:
        return const Campaigndetails();

      case AdminPage.creatorcampaigntracking:
        return const Creatorcampaigntracking();
      
      case AdminPage.creatorservicetracking:
        return const Creatorservicetracking();


      case AdminPage.creatoreacrning:
        return const Creatorearning();
      
      case AdminPage.instagracategorylist:
         InstagramCategoryBinding().dependencies();
        //  return const InstagramCategoryList();

        // return BlocProvider(
        //   create: (_) => InstagramCategoryBloc(
        //     Get.find<GetInstagramCategories>(),
        //     Get.find<AddInstagramCategoryUseCase>(),
        //   )..add(FetchInstagramCategories()),
        //   child: const InstagramCategoryList(),
        // );

        return BlocProvider(
          create: (_) => Get.find<InstagramCategoryBloc>()
            ..add(FetchInstagramCategories()),
          child: const InstagramCategoryList(),
        );

      // case AdminPage.support:
      //   return const HelpSupport();
      // case AdminPage.terms:
      //   return const Terms();
      // case AdminPage.transaction:
      //   return const Transactionhistory();
      // case AdminPage.userList:
      //   return const ListUser();
      // case AdminPage.wallettransaction:
      //   return const WalletTransaction();
      default:
        return AdminHomesc();

        // return const Delieverymainsc();
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: const Color(0xfff7f7f7),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Sidebar(
              collapsed: isCollapsed,
              onToggle: () => setState(() => isCollapsed = !isCollapsed), 
              onSelect: (page) {
                print(page);
              setState(() => selectedPage = page);
            },
            ),
            Expanded(
              child: Container(
                color: Colors.white54,
                child: Column(
                  children: [
                    const AdminHeader(),
                    Expanded(child: _buildContent()),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// import 'package:flutter/material.dart';
// import 'package:snappis/Presentation/Screens/Admin/Homepage/Admin_homeSC.dart';
// import 'package:snappis/Presentation/Widgets/Admin/Admin_header.dart';
// import 'package:snappis/Presentation/Widgets/Admin/Animatesidebar.dart';

// class AdminDashboard extends StatefulWidget {
//   const AdminDashboard({super.key});

//   @override
//   State<AdminDashboard> createState() => _AdminDashboardState();
// }

// class _AdminDashboardState extends State<AdminDashboard> {
//   bool collapsed = false;
//   int selectedIndex = 0;

//   Widget _page() {
//     switch (selectedIndex) {
//       case 1:
//         // return const Delieverymainsc();
//       default:
//         return const AdminHomesc();
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: const Color(0xFFF2F4F3),
//       body: Row(
//         children: [
//           AnimatedSidebar(
//             collapsed: collapsed,
//             selectedIndex: selectedIndex,
//             onToggle: (v) => setState(() => collapsed = v),
//             onSelect: (i) => setState(() => selectedIndex = i),
//           ),
//           Expanded(
//             child: Column(
//               children: [
//                 const AdminHeader(),
//                 Expanded(
//                   child: AnimatedSwitcher(
//                     duration: const Duration(milliseconds: 300),
//                     child: _page(),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }