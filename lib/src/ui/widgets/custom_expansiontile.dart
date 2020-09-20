import 'package:flutter/material.dart';
import 'package:global_template/global_template.dart';

class CustomExpansionTile extends StatelessWidget {
  final String title;
  final String subtitle;
  final Widget leading;
  final Function onPressedEdit;
  final List<Widget> parentMenu;
  final TextAlign titleAlign;
  final bool showButtonEdit;
  CustomExpansionTile({
    this.title = '',
    this.subtitle = '',
    this.titleAlign = TextAlign.left,
    this.leading,
    this.onPressedEdit,
    this.showButtonEdit = true,
    this.parentMenu = const <Widget>[],
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).copyWith(dividerColor: colorPallete.transparent);
    return Theme(
      data: theme,
      child: ExpansionTile(
        title: Text(
          title,
          textAlign: titleAlign,
          style: appTheme.subtitle1(context).copyWith(fontWeight: FontWeight.bold),
        ),
        subtitle: Text(
          subtitle,
          style: appTheme.caption(context),
        ),
        leading: CircleAvatar(child: leading),
        children: parentMenu.isNotEmpty
            ? parentMenu
            : <Widget>[
                Visibility(
                  visible: showButtonEdit ? true : false,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: SizedBox(
                      width: double.infinity,
                      child: OutlineButton(
                        child: Text('Ubah'),
                        onPressed: onPressedEdit,
                      ),
                    ),
                  ),
                ),
              ],
      ),
    );
  }
}
