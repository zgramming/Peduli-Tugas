import 'package:flutter/material.dart';
import 'package:global_template/global_template.dart';

class CardTugasTextRich extends StatelessWidget {
  CardTugasTextRich({this.content, this.title});

  final String title;
  final String content;
  @override
  Widget build(BuildContext context) {
    return Text.rich(
      TextSpan(
        style: appTheme.caption(context),
        children: [
          TextSpan(text: '$title : '),
          TextSpan(
            text: content,
            style: TextStyle(fontWeight: FontWeight.bold, color: colorPallete.primaryColor),
          ),
        ],
      ),
    );
  }
}
