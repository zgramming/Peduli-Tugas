import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:my_network/my_network.dart';
import 'package:my_provider/my_provider.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:global_template/global_template.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class DropdownDosen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (ctx, watch, _) {
      final dosen = watch(dosenProvider.state);
      final selectedDropdown = watch(PelajaranDropdownDosen).state;

      return DropdownSearch<DosenModel>(
        mode: Mode.BOTTOM_SHEET,
        hint: 'Pilih dosen',
        validator: (value) => value == null ? 'Dosen diperlukan' : null,
        onChanged: (value) => context.read(PelajaranDropdownDosen).state = value,
        showSearchBox: true,
        items: dosen,
        selectedItem: selectedDropdown,
        dropdownBuilder: (context, selectedItem, itemAsString) {
          if ((selectedItem == null)) {
            return Text('Pilih dosen');
          } else {
            return ListTile(
              title: Text(
                selectedItem.nameDosen,
                style: appTheme.caption(context).copyWith(fontWeight: FontWeight.bold),
              ),
              leading: CircleAvatar(
                backgroundImage: MemoryImage(base64.decode(selectedItem.imageDosen)),
              ),
            );
          }
        },
        popupItemBuilder: (context, item, isSelected) => ListTile(
          title: Text(
            '${item.nameDosen}',
            style: appTheme.caption(context).copyWith(fontWeight: FontWeight.bold),
          ),
          leading: CircleAvatar(
            backgroundImage: MemoryImage(
              base64.decode(item.imageDosen),
            ),
          ),
        ),
      );
    });
  }
}
