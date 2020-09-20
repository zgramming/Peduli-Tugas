import 'package:flutter/material.dart';
import 'package:my_provider/my_provider.dart';
import 'package:global_template/global_template.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../function/functions.dart';

import '../screens/detail_tugas_screen.dart';

import '../widgets/home/home_screen_pageview_header_dosen.dart';
import '../widgets/home/home_screen_pageview_dosen.dart';
import '../widgets/home/home_screen_pageview_chart.dart';
import '../widgets/home/home_screen_information.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    notificationPlugin.setListenerForLowerVersions(onNotificationInLowerVersions);
    notificationPlugin.setOnNotificationClick(onNotificationClick);
    Future.delayed(Duration.zero, () {
      context.read(GlobalContext).state = context;
      CommonFunction.readDarkModek().then((value) => context.read(GlobalIsDarkMode).state = value);
    });
  }

  void onNotificationInLowerVersions() {}
  void onNotificationClick(String payload) {
    if (payload != null) {
      debugPrint(' Payload On Click ' + payload);
      context.read(IDTugas).state = int.tryParse(payload);
      final tugas = context.read(tugasById);
      if (tugas != null) {
        Navigator.of(context).pushNamed(DetailTugasScreen.routeNamed);
      }
    }
  }

  @override
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(height: kToolbarHeight),
            SizedBox(
              height: sizes.height(context) / 2.5,
              child: HomeScreenPageViewChart(),
            ),
            SizedBox(height: 20),
            HomeScreenInformation(),
            SizedBox(height: 20),
            HomeScreenPageViewHeaderDosen(),
            SizedBox(height: 20),
            HomeScreenPageViewDosen(),
            SizedBox(height: kToolbarHeight),
          ],
        ),
      ),
    );
  }
}
