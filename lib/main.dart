import 'package:annotation/screens/splash_screen/view/splash_screen.dart';
import 'package:annotation/utils/theme/theme_data.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import 'bindings/initializing_dependency.dart';

main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();
  runApp(const AnnotationApp());
}

class AnnotationApp extends StatelessWidget {
  const AnnotationApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: GetMaterialApp(
        initialBinding: InitializingDependency(),
        debugShowCheckedModeBanner: false,
        title: 'Annotation',
        theme: CustomThemeData.lightViewTheme,
        home: const SplashScreen(),
      ),
    );
  }
}
