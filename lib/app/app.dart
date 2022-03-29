import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:optovka/app/resources/app_theme.dart';

import 'routes/app_pages.dart';

class App extends StatelessWidget {
  const App({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: "Optovka",
      debugShowCheckedModeBanner: false,
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
      theme: AppTheme.lightTheme,
    );
  }
}
