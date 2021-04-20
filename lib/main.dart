import 'package:corrode/modules/splash/splash_page.dart';
import 'package:corrode/modules/splash/splash_binding.dart';
import 'package:corrode/routes/app_pages.dart';
import 'package:corrode/theme/app_theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(GetMaterialApp(
    initialRoute: "/",
    builder: (context, child) => Scaffold(
      body: GestureDetector(
        onTap: () {
          hideKeyboard(context);
        },
        child: child,
      ),
    ),
    theme: appThemeData,
    defaultTransition: Transition.native,
    getPages: AppPages.pages,
    initialBinding: SplashBinding(),
    home: SplashPage(),
  ));
}

void hideKeyboard(BuildContext context) {
  FocusScopeNode currentFocus = FocusScope.of(context);
  if (!currentFocus.hasPrimaryFocus && currentFocus.focusedChild != null) {
    FocusManager.instance.primaryFocus.unfocus();
  }
}
