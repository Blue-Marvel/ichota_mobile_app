import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ichota_mobile_app/utils/constants/app_fonts.dart';
import 'package:ichota_mobile_app/utils/constants/colors.dart';
import 'package:ichota_mobile_app/utils/routes/routes.dart';

void main() {
  runApp(ProviderScope(child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'iChota Interview',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: AppFonts.poppins,
        colorScheme: ColorScheme.fromSeed(seedColor: AppColor.blueColor),
        useMaterial3: true,
      ),
      routerConfig: Routes.routes,
    );
  }
}
