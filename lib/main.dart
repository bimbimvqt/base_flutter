import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/route_manager.dart';
import 'package:provider/provider.dart';
import 'package:startup_app/routes/app_pages.dart';
import 'package:startup_app/themes/theme_manager.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (BuildContext context) {
        return ThemeProvider()..setInitTheme();
      },
      child: Builder(
        builder: (context) {
          final size = MediaQuery.of(context).size;
          return ScreenUtilInit(
            designSize: size,
            minTextAdapt: true,
            splitScreenMode: true,
            builder: (context, child) {
              return MediaQuery(
                data: MediaQuery.of(context).copyWith(textScaler: const TextScaler.linear(1.0)),
                child: GetMaterialApp(
                  debugShowCheckedModeBanner: false,
                  title: 'startup_app',
                  theme: Provider.of<ThemeProvider>(context).themeData,
                  getPages: AppPages.routes,
                  initialRoute: AppPages.INITIAL,
                  locale: const Locale('en', 'US'),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
