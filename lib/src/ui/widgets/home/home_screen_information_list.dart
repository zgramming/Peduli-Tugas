import 'package:flutter/material.dart';
import 'package:global_template/global_template.dart';

class HomeScreenInformationList extends StatelessWidget {
  final String title;
  final String content;
  final IconData icon;
  HomeScreenInformationList({this.icon = Icons.person, this.title = '', this.content = ''});
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: colorPallete.primaryColor),
        borderRadius: BorderRadius.circular(30),
      ),
      child: ListTile(
        leading: CircleAvatar(
          foregroundColor: colorPallete.white,
          backgroundColor: colorPallete.primaryColor,
          child: Icon(icon),
        ),
        title: Text(
          title,
          style: appTheme.bodyText1(context),
        ),
        trailing: FittedBox(
          child: ActionRoundedButton(
            size: 9,
            icon: Text(
              content,
              style: appTheme
                  .headline1(context)
                  .copyWith(color: colorPallete.white, fontWeight: FontWeight.bold),
            ),
          ),
        ),
      ),
    );
  }
}
