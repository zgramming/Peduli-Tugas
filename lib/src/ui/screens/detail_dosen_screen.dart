import 'package:flutter/material.dart';
import 'package:my_provider/my_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:global_template/global_template.dart';

import '../screens/form_dosen_screen.dart';

import '../widgets/detail_dosen/detaildosen_background_image.dart';
import '../widgets/detail_dosen/detaildosen_gridview.dart';

import '../../function/common_function.dart';

class DetailDosenScreen extends ConsumerWidget {
  static const routeNamed = '/detail-dosen-screen';
  final int id;
  DetailDosenScreen(this.id);

  @override
  Widget build(BuildContext context, ScopedReader watch) {
    final result = watch(showDosenByid(id));
    if (result == null) {
      return Scaffold();
    }
    var popupMenuItem = [
      PopupMenuItem(child: Text('Ubah Profil'), value: 'edit_dosen'),
      PopupMenuItem(
        child: Text('Email Dosen'),
        value: 'email_dosen',
        enabled: result.emailDosen.isEmpty ? false : true,
      ),
      PopupMenuItem(
        child: Text('Hubungi Dosen'),
        value: 'call_dosen',
        enabled: result.telpDosen.isEmpty ? false : true,
      ),
    ];
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(result.nameDosen),
        actions: [
          PopupMenuButton(
            itemBuilder: (context) => popupMenuItem.map((e) => e).toList(),
            onSelected: (value) async {
              switch (value) {
                case 'edit_dosen':
                  context.read(DosenModelEdit).state = result;
                  await Navigator.of(context).pushNamed(FormDosenScreen.routeNamed);
                  break;
                case 'call_dosen':
                  await CommonFunction.callPhone(result.telpDosen);
                  break;
                case 'email_dosen':
                  await CommonFunction.sendEmail(result.emailDosen);
                  break;
                default:
                  await GlobalFunction.showToast(
                      message: 'Menu tidak valid', toastType: ToastType.Error);
                  break;
              }
            },
          ),
        ],
      ),
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          // These are the slivers that show up in the "outer" scroll view.
          return <Widget>[
            SliverOverlapAbsorber(
              handle: NestedScrollView.sliverOverlapAbsorberHandleFor(context),
              sliver: SliverAppBar(
                automaticallyImplyLeading: false,
                pinned: false,
                floating: true,
                snap: true,
                expandedHeight: sizes.height(context) / 3,
                forceElevated: innerBoxIsScrolled,
                flexibleSpace: DetailDosenBackgroundImage(model: result),
              ),
            ),
          ];
        },
        body: Consumer(builder: (ctx, watch, _) {
          final pelajaran = watch(groupedPelajaranByDosenBySemester(result.idDosen));
          if (pelajaran == null || pelajaran.isEmpty) {
            return Center(child: Text('Pelajaran Tidak Ditemukan'));
          }
          return SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: pelajaran
                  .map((keyMap, valueMap) {
                    return MapEntry(
                      keyMap,
                      Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Text(
                              keyMap,
                              style: appTheme.headline6(context).copyWith(color: colorPallete.grey),
                            ),
                            DetailDosenGridView(valueMap: valueMap),
                          ],
                        ),
                      ),
                    );
                  })
                  .values
                  .toList(),
            ),
          );
        }),
      ),
    );
  }
}
