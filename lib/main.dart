import 'package:arrows/helpers/shared_prefrences.dart';
import 'package:arrows/modules/MainBranches/screens/branches_screen.dart';
import 'package:arrows/modules/splash_screen/splash_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'Translations/translations.dart';
import 'constants/colors.dart';
import 'modules/sign_up/screens/add_name.dart';

Future initialization(BuildContext? context) async {
  await Future.delayed(Duration(seconds: 3));
}

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.removeAfter(initialization);

  await Firebase.initializeApp();
  String userDeviceToken = await FirebaseMessaging.instance.getToken() ?? "";
  await CacheHelper.onInit();
  await CacheHelper.saveDataToSharedPrefrence("deviceToken", userDeviceToken);

  Locale? language;
  if (CacheHelper.getDataToSharedPrefrence("localeIsArabic") == null) {
    if (Get.deviceLocale == const Locale("ar_US")) {
      await CacheHelper.saveDataToSharedPrefrence("localeIsArabic", false);
    } else {
      await CacheHelper.saveDataToSharedPrefrence("localeIsArabic", true);
    }
    language = CacheHelper.getDataToSharedPrefrence("localeIsArabic")
        ? const Locale("ar")
        : const Locale("en");
  } else {
    language = CacheHelper.getDataToSharedPrefrence("localeIsArabic")
        ? const Locale("ar")
        : const Locale("en");
  }

  runApp(MyApp(
    language: language,
    isOpened: true,
  ));
}

class MyApp extends StatelessWidget {
  Locale? language;
  bool? isOpened;

  MyApp({this.language, this.isOpened});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: Size(460, 847),
        builder: (BuildContext, Widget) {
          return GetMaterialApp(
            debugShowCheckedModeBanner: false,
            translations: Languages(),
            locale: language,
            fallbackLocale: Locale('ar'),
            title: 'Arrows Restaurant',
            theme: ThemeData(
              fontFamily: 'Cairo',
              scaffoldBackgroundColor: kPrimaryColor,
              iconTheme: IconThemeData(color: kPrimaryColor, size: 33),
              appBarTheme: AppBarTheme(
                color: mainColor,
                systemOverlayStyle:
                    SystemUiOverlayStyle(statusBarColor: mainColor),
                shadowColor: mainColor,
                iconTheme: IconThemeData(color: mainColor),
              ),
              bottomNavigationBarTheme: BottomNavigationBarThemeData(
                selectedIconTheme: IconThemeData(color: mainColor),
                selectedLabelStyle: TextStyle(color: mainColor),
                selectedItemColor: kBottomNavBarSelectedIconColor,
                unselectedIconTheme: IconThemeData(color: mainColor),
                unselectedItemColor: mainColor,
                showSelectedLabels: true,
                backgroundColor: mainColor,
                type: BottomNavigationBarType.shifting,
              ),
            ),
            // home: SignUpScreen(),
            // home: AddNameScreen(),
            home: SplashScreen(),
          );
        });
  }
}
