import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_provider/my_provider.dart';

import './ui/screens/welcome_screen.dart';
import './ui/screens/form_dosen_screen.dart';
import './ui/screens/form_pelajaran_screen.dart';
import './ui/screens/form_tugas_screen.dart';
import './ui/screens/edit_screen.dart';
import './ui/screens/tugas_by_pelajaran_screen.dart';
import './ui/screens/detail_dosen_screen.dart';
import './ui/screens/detail_tugas_screen.dart';

class ApplicationRoutes {
  static Map<String, Widget Function(BuildContext)> routes = {
    WelcomeScreen.routeNamed: (ctx) => WelcomeScreen(),
    FormDosenScreen.routeNamed: (ctx) => FormDosenScreen(),
    FormPelajaranScreen.routeNamed: (ctx) {
      Future.delayed(
          Duration.zero, () => ctx.read(GlobalFormType).state = FormType.IsFormPelajaran);
      return FormPelajaranScreen();
    },
    FormTugasScreen.routeNamed: (ctx) {
      Future.delayed(Duration.zero, () => ctx.read(GlobalFormType).state = FormType.IsFormTugas);
      return FormTugasScreen();
    },
    EditScreen.routeNamed: (ctx) => EditScreen(ModalRoute.of(ctx).settings.arguments),
    TugasByPelajaranScreen.routeNamed: (ctx) =>
        TugasByPelajaranScreen(ModalRoute.of(ctx).settings.arguments),
    DetailDosenScreen.routeNamed: (ctx) => DetailDosenScreen(ModalRoute.of(ctx).settings.arguments),
    DetailTugasScreen.routeNamed: (ctx) => DetailTugasScreen(),
  };
}
