import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:global_template/global_template.dart';
import 'package:my_provider/my_provider.dart';

import '../widgets/detail_tugas/detailtugas_action.dart';
import '../widgets/detail_tugas/detailtugas_appbar.dart';
import '../widgets/detail_tugas/detailtugas_content.dart';

class DetailTugasScreen extends StatelessWidget {
  static const routeNamed = '/detail-tugas-screen';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer(
        builder: (context, watch, _) {
          final tugas = watch(tugasById);
          if (tugas == null) {
            return SizedBox();
          }
          return Stack(
            fit: StackFit.expand,
            children: [
              Positioned.fill(
                child: Container(
                  color: colorPallete.primaryColor,
                ),
              ),
              DetailTugasAppbar(),
              DetailTugasContent(),
              DetailTugasAction(),
            ],
          );
        },
      ),
    );
  }
}
