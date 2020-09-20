import 'package:flutter/material.dart';
import 'package:global_template/global_template.dart';

import './welcome_screen.dart';

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SplashScreenTemplate(
        image: ShowImageAsset(
          scale: 2,
          alignment: Alignment.center,
          imageUrl: '${AppConfig.urlImageAsset}/${AppConfig.urlLogoAsset}',
        ),
        navigateAfterSplashScreen: (context) => WelcomeScreen(),
        copyRightVersion: CopyRightVersion(),
      ),
    );
  }
}
