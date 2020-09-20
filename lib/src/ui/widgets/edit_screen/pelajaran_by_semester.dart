import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:my_network/my_network.dart';
import 'package:my_provider/my_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:global_template/global_template.dart';
import 'package:peduli_tugas/src/function/crud_function.dart';

import '../../screens/tugas_by_pelajaran_screen.dart';
import '../../screens/form_pelajaran_screen.dart';

import './card_pelajaran_by_semester.dart';
import './card_edit_button.dart';
import './chips_day.dart';

class PelajaranBySemester extends StatelessWidget {
  final SemesterModel semester;
  PelajaranBySemester({@required this.semester});

  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (ctx, watch, _) {
      final pelajaran = watch(showPelajaranBySemester(semester.idSemester));
      if (pelajaran == null || pelajaran.isEmpty) {
        return SizedBox();
      }
      return ListView.separated(
        itemCount: pelajaran.length,
        physics: NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        separatorBuilder: (BuildContext context, int index) {
          return Divider();
        },
        itemBuilder: (BuildContext context, int index) {
          final result = pelajaran[index];
          return CardPelajaranBySemester(
            title: result.namePelajaran,
            trailing: PopupMenuButton(
              itemBuilder: (_) => [
                PopupMenuItem(
                  child: Text('Lihat Tugas ${result.namePelajaran}'),
                  value: 'lihat_tugas',
                ),
              ],
              onSelected: (String value) {
                switch (value) {
                  case 'lihat_tugas':
                    Navigator.of(context).pushNamed(
                      TugasByPelajaranScreen.routeNamed,
                      arguments: result,
                    );
                    break;
                  default:
                }
              },
            ),
            leading: CircleAvatar(
              backgroundImage: MemoryImage(
                base64.decode(result.dosen.imageDosen),
              ),
            ),
            children: [
              ChipsDayPelajaran(result),
              CardEditButton(
                onEdit: () {
                  context.read(PelajaranModelEdit).state = result;
                  Navigator.of(context).pushNamed(FormPelajaranScreen.routeNamed);
                },
                onDelete: () async => await showDialog(
                  context: context,
                  builder: (context) => ConfirmationDeleteDialog(
                    content: Text.rich(
                      TextSpan(
                        text: 'Tugas yang berkaitan dengan ',
                        children: [
                          TextSpan(
                            text: '${result.namePelajaran} ',
                            style: appTheme
                                .bodyText1(context)
                                .copyWith(color: colorPallete.primaryColor),
                          ),
                          TextSpan(text: 'akan ikut terhapus. Tetap ingin menghapus ?')
                        ],
                      ),
                      style: appTheme.caption(context),
                    ),
                    onDelete: () async => await CRUDFunction.CRUDDeletePelajaran(
                      context,
                      idPelajaran: result.idPelajaran,
                    ),
                  ),
                ),
              ),
            ],
          );
        },
      );
    });
  }
}
