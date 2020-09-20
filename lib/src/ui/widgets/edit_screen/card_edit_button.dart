import 'package:flutter/material.dart';
import 'package:global_template/global_template.dart';

class CardEditButton extends StatelessWidget {
  const CardEditButton({
    Key key,
    @required this.onEdit,
    @required this.onDelete,
  }) : super(key: key);

  final VoidCallback onEdit;
  final VoidCallback onDelete;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: <Widget>[
        Flexible(
          child: Transform.scale(
            scale: .8,
            child: RaisedButton(
              onPressed: onEdit,
              child: Text('Ubah'),
              textColor: colorPallete.white,
              color: colorPallete.primaryColor,
            ),
          ),
        ),
        Flexible(
          child: Transform.scale(
            scale: .8,
            child: OutlineButton(
              onPressed: onDelete,
              child: Text('Hapus'),
              textColor: colorPallete.red,
              borderSide: BorderSide(color: colorPallete.red),
            ),
          ),
        )
      ],
    );
  }
}
