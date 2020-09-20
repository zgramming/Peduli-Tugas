import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:my_provider/my_provider.dart';
import 'package:global_template/global_template.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import './modal_bottomsheet_pick_image.dart';

class DosenImagePicker extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: InkWell(
        onTap: () async {
          await showModalBottomSheet(
            context: context,
            builder: (context) => ModalBottomSheetPickImage(),
          );
        },
        child: Consumer(builder: (ctx, watch, _) {
          final resultBase64Image = watch(DosenBase64Image).state;
          return CircleAvatar(
            foregroundColor: colorPallete.black,
            backgroundImage:
                resultBase64Image == null ? null : MemoryImage(base64.decode(resultBase64Image)),
            radius: sizes.width(context) / 6,
            backgroundColor:
                resultBase64Image == null ? colorPallete.accentColor : colorPallete.transparent,
            child: resultBase64Image == null ? Text('Pilih Gambar') : SizedBox(),
          );
        }),
      ),
    );
  }
}
