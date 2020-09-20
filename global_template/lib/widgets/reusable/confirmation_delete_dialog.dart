import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:global_template/global_template.dart';

class ConfirmationDeleteDialog extends StatelessWidget {
  final VoidCallback onCancel;
  final VoidCallback onDelete;
  final Widget title;
  final Widget content;
  final String deleteText;

  /// Digunakan jika dalam kasus dialog berada di atas modalbottomsheet
  ///
  final int totalNavigatorPop;
  ConfirmationDeleteDialog({
    this.onCancel,
    this.onDelete,
    this.content,
    this.title,
    this.deleteText,
    this.totalNavigatorPop = 1,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: title ?? Text('Konfirmasi hapus'),
      actions: [
        FlatButton(
          onPressed: onCancel ?? () => Navigator.of(context).pop(),
          child: Text('Batal'),
        ),
        RaisedButton(
          onPressed: () {
            onDelete();
            // Navigator.of(context).pop();
            var totalPop = 0;
            SchedulerBinding.instance.addPostFrameCallback((_) {
              Navigator.popUntil(context, (route) => totalPop++ == totalNavigatorPop);
            });
          },
          color: colorPallete.red,
          child: Text(deleteText ?? 'Hapus'),
        )
      ],
      content: content,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
    );
  }
}
