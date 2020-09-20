import 'package:flutter/material.dart';
import 'package:global_template/global_template.dart';

class GroupedDosenFirstLetter extends StatelessWidget {
  GroupedDosenFirstLetter(this.firstLetter);
  final String firstLetter;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: FittedBox(
          child: Text(
            firstLetter.toUpperCase(),
            style: appTheme.subtitle1(context).copyWith(fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}
