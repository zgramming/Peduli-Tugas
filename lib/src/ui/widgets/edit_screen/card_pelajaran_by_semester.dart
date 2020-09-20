import 'package:flutter/material.dart';
import 'package:global_template/global_template.dart';

class CardPelajaranBySemester extends StatelessWidget {
  final String title;
  final Widget leading;
  final Widget trailing;
  final List<Widget> children;
  final VoidCallback onEdit;
  final VoidCallback onDelete;

  CardPelajaranBySemester({
    this.title,
    this.leading,
    this.trailing,
    this.children = const <Widget>[],
    this.onEdit,
    this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ListTile(
              title: Text(
                title,
                style: appTheme.subtitle1(context),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
              leading: leading,
              trailing: trailing,
            ),
            SizedBox(height: 10),
            ...children
          ],
        ),
      ),
    );
  }
}
