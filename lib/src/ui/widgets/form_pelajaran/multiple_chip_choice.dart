import 'package:flutter/material.dart';
import 'package:my_network/my_network.dart';
import 'package:my_provider/my_provider.dart';
import 'package:global_template/global_template.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MultipleChipChoosed extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (ctx, watch, _) {
        final listDay = watch(PelajaranSelectedDay).state;
        return Wrap(
          children: listHari.map(
            (e) {
              final result =
                  listDay.firstWhere((element) => element.idDay == e.idDay, orElse: () => null);
              return ChoiceChip(
                label: Text(
                  e.nameDay,
                  style: appTheme.caption(context).copyWith(color: colorPallete.white),
                ),
                selected: result == null ? false : true,
                backgroundColor: Color(e.codeColor).withOpacity(.3),
                selectedColor:
                    result != null ? Color(e.codeColor) : Color(e.codeColor).withOpacity(.5),
                onSelected: (value) {
                  var tempList = [...listDay];
                  if (tempList.isEmpty) {
                    tempList.add(e);
                  } else {
                    final result = tempList.singleWhere((element) => element.idDay == e.idDay,
                        orElse: () => null);
                    if (result == null) {
                      tempList.add(e);
                    } else {
                      tempList.remove(e);
                    }
                  }
                  context.read(PelajaranSelectedDay).state = tempList;
                },
              );
            },
          ).toList(),
          spacing: 10,
        );
      },
    );
  }
}
