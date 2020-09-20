import 'package:flutter/material.dart';
import 'package:global_template/global_template.dart';

import '../../screens/edit_screen.dart';

class HomeScreenPageViewHeaderDosen extends StatelessWidget {
  const HomeScreenPageViewHeaderDosen({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Text(
            'Daftar Dosen',
            style: appTheme.subtitle1(context),
          ),
        ),
        InkWell(
          onTap: () async => await Navigator.of(context).pushNamed(
            EditScreen.routeNamed,
            arguments: AppConfig.MENU_DOSEN,
          ),
          child: Text(
            'Lihat semua',
            style: appTheme.caption(context).copyWith(color: colorPallete.primaryColor),
          ),
        )
      ],
    );
  }
}
