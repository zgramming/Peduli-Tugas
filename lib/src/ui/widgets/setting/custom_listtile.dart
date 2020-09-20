import 'package:flutter/material.dart';
import 'package:global_template/global_template.dart';

class CustomListTile extends StatelessWidget {
  final String title;
  final String subtitle;
  final Widget leading;
  final Widget trailing;
  final VoidCallback onTap;
  CustomListTile({this.title = '', this.subtitle = '', this.leading, this.trailing, this.onTap});
  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        title,
        style: appTheme.subtitle1(context).copyWith(fontWeight: FontWeight.bold),
      ),
      subtitle: Text(
        subtitle,
        style: appTheme.caption(context),
      ),
      leading: CircleAvatar(child: leading),
      trailing: trailing,
      onTap: onTap,
    );
  }
}
