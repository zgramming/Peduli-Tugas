import 'package:flutter/material.dart';
import 'package:global_template/global_template.dart';

class ModalBottomSheetAddingOption extends StatelessWidget {
  final VoidCallback onTap;
  final IconData icon;
  final String title;

  ModalBottomSheetAddingOption({@required this.onTap, @required this.icon, @required this.title});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Card(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Flexible(
                  flex: 2,
                  child: Icon(
                    icon,
                    color: GlobalFunction.getRandomColor(),
                    size: sizes.width(context) / 10,
                  ),
                ),
                Flexible(
                  flex: 1,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      title,
                      style: appTheme.caption(context),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        Positioned.fill(
          child: Material(
            color: colorPallete.transparent,
            child: InkWell(
              onTap: onTap,
            ),
          ),
        )
      ],
    );
  }
}
