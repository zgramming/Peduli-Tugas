import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:my_network/my_network.dart';
import 'package:global_template/global_template.dart';

import './taskscreen_tugas.dart';

import '../../screens/detail_dosen_screen.dart';

class TaskScreenCard extends StatelessWidget {
  final PelajaranModel keyPelajaran;
  final List<TugasModel> valueTugas;
  TaskScreenCard({@required this.keyPelajaran, @required this.valueTugas});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 4.0),
      // color: colorPallete.accentColor,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 4.0),
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    keyPelajaran.namePelajaran,
                    style: appTheme.subtitle1(context).copyWith(fontWeight: FontWeight.w500),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                InkWell(
                  onTap: () async => await Navigator.of(context).pushNamed(
                      DetailDosenScreen.routeNamed,
                      arguments: keyPelajaran.dosen.idDosen),
                  child: CircleAvatar(
                    backgroundImage: MemoryImage(base64.decode(keyPelajaran.dosen.imageDosen)),
                  ),
                ),
              ],
            ),
          ),
          Divider(thickness: 2, endIndent: 15, indent: 15),
          Container(
            decoration: BoxDecoration(
              // color: colorPallete.white,
              borderRadius: BorderRadius.vertical(
                bottom: Radius.circular(20),
              ),
            ),
            child: ListView.builder(
              itemCount: valueTugas.length,
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemBuilder: (BuildContext context, int index) {
                final result = valueTugas[index];
                return TaskScreenTugas(result: result);
              },
            ),
          )
        ],
      ),
    );
  }
}
