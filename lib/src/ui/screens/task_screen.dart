import 'package:flutter/material.dart';
import 'package:global_template/global_template.dart';

import '../widgets/task/taskscreen_tabbar.dart';
import '../widgets/task/taskscreen_date.dart';

class TaskScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        TaskScreenTabBar(),
        Positioned(
          top: kToolbarHeight + sizes.height(context) / 25,
          left: 0,
          right: 0,
          child: TaskScreenDate(),
        )
      ],
    );
  }
}
