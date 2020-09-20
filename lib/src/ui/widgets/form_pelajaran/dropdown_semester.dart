import 'package:flutter/material.dart';
import 'package:my_network/my_network.dart';
import 'package:my_provider/my_provider.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:global_template/global_template.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class DropdownSemester extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (ctx, watch, _) {
      final selectedDropdown = watch(PelajaranDropdownSemester).state;

      return DropdownSearch<SemesterModel>(
        mode: Mode.BOTTOM_SHEET,
        validator: (value) => value == null ? 'Semester dibutuhkan' : null,
        onChanged: (value) => context.read(PelajaranDropdownSemester).state = value,
        showSearchBox: true,
        items: listSemester,
        selectedItem: selectedDropdown,
        dropdownBuilder: (context, selectedItem, itemAsString) {
          if ((selectedItem == null)) {
            return Text('Pilih Semester');
          } else {
            return ListTile(
              title: Text(
                selectedItem.nameSemester,
                style: appTheme.caption(context).copyWith(fontWeight: FontWeight.bold),
              ),
            );
          }
        },
        popupItemBuilder: (context, item, isSelected) {
          return ListTile(
            title: Text(
              item.nameSemester,
              style: appTheme.caption(context).copyWith(fontWeight: FontWeight.bold),
            ),
          );
        },
      );
    });
  }
}
