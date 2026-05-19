import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:snappis/Presentation/Binding/auth_binding.dart';
import 'package:snappis/Presentation/Screens/Business/Boption_main_page.dart';
import 'package:snappis/Presentation/Screens/Forgot_password/Forgot_password.dart';
import 'package:snappis/Presentation/Screens/Login/Business_login.dart';
import 'package:snappis/Presentation/Screens/Login/Creator_logins.dart';
import 'package:snappis/Presentation/Screens/Creator/ReelsApp/creator_reels_main.dart';
import 'package:snappis/Presentation/Screens/Signup/Business_signup.dart';
import 'package:snappis/Presentation/Screens/Signup/Creator_signup.dart';
import 'package:snappis/Presentation/Screens/Splash_screen.dart';
import 'package:snappis/Presentation/Screens/Business/home/Brand_home_screen.dart';
import 'package:snappis/Presentation/Screens/Business/Campaign/Master_Campaign/Campaignmainpage.dart';
import 'package:snappis/Presentation/Screens/Business/Campaign/Master_Campaign/Basic_Detail.dart';
import 'package:snappis/Presentation/Screens/Creator/AI/ai_assistant_screen.dart';
import 'package:snappis/Presentation/Screens/Chat/chat_list_screen.dart';
import 'package:snappis/Presentation/Screens/Creator/Business_profile/business_profile_screen.dart';
import 'package:snappis/Presentation/Screens/Creator/Business_profile/settings_screen.dart';
import 'package:snappis/Presentation/Screens/Creator/Business_profile/brand_edit_profile_screen.dart';
import 'package:snappis/Presentation/Screens/Creator/Business_profile/brand_about_screen.dart';
import 'package:snappis/Presentation/Screens/Creator/Business_profile/brand_wallet_screen.dart';
import 'package:snappis/Presentation/Screens/Creator/Business_profile/brand_wallet_add_money_screen.dart';
import 'Presentation/Screens/User_type_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690), // Standard responsive design size
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return GetMaterialApp(
          title: 'Snappis',
          debugShowCheckedModeBanner: false,

          /// 🔗 Initial dependency injection
          initialBinding: AuthBinding(),

          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          ),

          getPages: [
            GetPage(name: "/", page: () => const SplashScreen()),
            GetPage(name: "/UserTypeScreen", page: () => const UserTypeScreen()),
            GetPage(name: "/Brand-choice", page: () => const BusinessMainPage()),
            GetPage(name: "/Brand-Signup", page: () => const BusinessSignup()),
            GetPage(name: "/Brand-Login", page: () => const BusinessLogin()),
            GetPage(name: "/Creator-choice", page: () => const CreatorReelsMain()),
            GetPage(name: "/Creator-Signup", page: () => const CreatorSignup()),
            GetPage(name: "/Creator-Login", page: () => const CreatorLogins()),
            GetPage(name: "/AI", page: () => const AIAssistantScreen()),
            GetPage(name: "/fpass", page: () => const ForgotPassword()),
            GetPage(name: "/Brand-Home", page: () => const BrandHomeScreen()),
            GetPage(name: "/Campaign-Main", page: () => const Campaignmainpage()),
            GetPage(name: "/Basic-Detail", page: () => const BasicDetail()),
            GetPage(name: "/Chat", page: () => const ChatListScreen()),
            GetPage(name: "/Profile", page: () => const BusinessProfileScreen()),
            GetPage(name: "/Settings", page: () => const SettingsScreen()),
            GetPage(
              name: "/Brand-Edit-Profile",
              page: () => const BrandEditProfileScreen(),
            ),
            GetPage(name: "/Brand-About", page: () => const BrandAboutScreen()),
            GetPage(name: "/Brand-Wallet", page: () => const BrandWalletScreen()),
            GetPage(
              name: "/Brand-Wallet-Add-Money",
              page: () => const BrandWalletAddMoneyScreen(),
            ),
          ],

          /// 🏁 Initial Screen
          initialRoute: "/Brand-Home",
        );
      },
    );
  }
}
