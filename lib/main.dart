
import 'package:annotation/screens/splash_screen/view/splash_screen.dart';
import 'package:annotation/utils/theme/theme_data.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'bindings/initializing_dependency.dart';


void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: GetMaterialApp(
        initialBinding: InitializingDependency(),
        debugShowCheckedModeBanner: false,
        title: 'Exoid',
        theme: CustomThemeData.lightViewTheme,
        home: const SplashScreen(),
      ),
    );
  }
}

