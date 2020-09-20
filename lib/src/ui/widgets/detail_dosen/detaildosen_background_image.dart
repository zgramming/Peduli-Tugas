import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:my_network/my_network.dart';
import 'package:my_provider/my_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:global_template/global_template.dart';

class DetailDosenBackgroundImage extends StatelessWidget {
  final DosenModel model;
  DetailDosenBackgroundImage({@required this.model});
  @override
  Widget build(BuildContext context) {
    return FlexibleSpaceBar(
      background: Stack(
        fit: StackFit.expand,
        children: [
          Hero(
            tag: 'pageview'+model.idDosen.toString(),
            child: Image.memory(
              base64.decode(model.imageDosen),
              fit: BoxFit.cover,
            ),
          ),
          Positioned(
            child: Container(
              color: Colors.black54,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: Consumer(builder: (ctx, watch, _) {
                  final pelajaran = watch(showPelajaranByDosen(model.idDosen));
                  final totPelajaran = watch(totalPelajaranByDosen(model.idDosen));
                  final totTugas = watch(totalTugasByDosen(model.idDosen));
                  if (pelajaran == null || pelajaran.isEmpty) {
                    return SizedBox();
                  }
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text.rich(
                        TextSpan(text: 'Pelajaran :', children: [
                          TextSpan(
                              text: '$totPelajaran',
                              style: appTheme
                                  .headline4(context)
                                  .copyWith(color: colorPallete.white, fontWeight: FontWeight.bold))
                        ]),
                        style: appTheme.caption(context).copyWith(color: colorPallete.white),
                      ),
                      Text.rich(
                        TextSpan(text: 'Tugas :', children: [
                          TextSpan(
                              text: '$totTugas',
                              style: appTheme
                                  .headline4(context)
                                  .copyWith(color: colorPallete.white, fontWeight: FontWeight.bold))
                        ]),
                        style: appTheme.caption(context).copyWith(color: colorPallete.white),
                      ),
                    ],
                  );
                }),
              ),
            ),
            bottom: 0,
            left: 0,
            right: 0,
          )
        ],
      ),
    );
  }
}
