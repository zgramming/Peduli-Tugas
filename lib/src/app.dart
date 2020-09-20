import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:global_template/global_template.dart';
import 'package:my_provider/my_provider.dart';

import './ui/screens/splash_screen.dart';

import './routes.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, watch, _) {
        final isDarkMode = watch(GlobalIsDarkMode).state;
        return MaterialApp(
          title: 'Peduli Tugas',
          debugShowCheckedModeBanner: false,
          theme: ColorPallete.dynamicTheme(isDarkMode, context),
          home: SplashScreen(),
          routes: ApplicationRoutes.routes,
        );
      },
    );
  }
}
