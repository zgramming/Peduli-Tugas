import 'package:flutter/material.dart';
import 'package:my_provider/my_provider.dart';
import 'package:global_template/global_template.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../function/common_function.dart';

class ModalBottomSheetPickImage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Wrap(
          alignment: WrapAlignment.spaceEvenly,
          children: <Widget>[
            InkWell(
              onTap: () async {
                final String resultBase64 =
                    await CommonFunction.pickImage(quality: 80, returnFile: ReturnFile.BASE64);
                context.read(DosenBase64Image).state = resultBase64;
              },
              child: CircleAvatar(
                foregroundColor: colorPallete.white,
                backgroundColor: colorPallete.green,
                child: Icon(Icons.camera_alt),
              ),
            ),
            InkWell(
              onTap: () async {
                final String resultBase64 =
                    await CommonFunction.pickImage(returnFile: ReturnFile.BASE64, isCamera: false);
                if (resultBase64 != null) {
                  context.read(DosenBase64Image).state = resultBase64;
                }
              },
              child: CircleAvatar(
                foregroundColor: colorPallete.white,
                backgroundColor: colorPallete.blue,
                child: Icon(Icons.photo_library),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
