import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:my_network/my_network.dart';
import 'package:my_provider/my_provider.dart';
import 'package:global_template/global_template.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class DropdownPelajaran extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (ctx, watch, _) {
        final pelajaran = watch(pelajaranProvider.state);
        final selectedDropdown = watch(TugasDropdownPelajaran).state;
        return DropdownSearch<PelajaranModel>(
          mode: Mode.BOTTOM_SHEET,
          hint: 'Pilih Pelajaran',
          validator: (value) => value == null ? 'Pelajaran diperlukan' : null,
          onChanged: (value) => context.read(TugasDropdownPelajaran).state = value,
          showSearchBox: true,
          items: pelajaran,
          selectedItem: selectedDropdown,
          dropdownBuilder: (context, selectedItem, itemAsString) {
            if ((selectedItem == null)) {
              return Text('Pilih Pelajaran');
            } else {
              return ListTile(
                title: Text(
                  selectedItem.namePelajaran,
                  style: appTheme.caption(context).copyWith(fontWeight: FontWeight.bold),
                ),
                subtitle: Text(
                  'Dosen : ${selectedItem.dosen.nameDosen}',
                  style: appTheme.caption(context),
                ),
                leading: CircleAvatar(
                  backgroundImage: MemoryImage(base64.decode(selectedItem.dosen.imageDosen)),
                ),
              );
            }
          },
          popupItemBuilder: (context, item, isSelected) {
            return Container(
              padding: const EdgeInsets.only(bottom: 12.0),
              decoration:
                  BoxDecoration(border: Border(bottom: BorderSide(color: colorPallete.grey))),
              child: ListTile(
                title: Text(
                  '${item.namePelajaran}',
                  style: appTheme.subtitle2(context).copyWith(),
                ),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Dosen : ${item.dosen.nameDosen}',
                      style: appTheme.caption(context),
                    ),
                    Text(
                      'Semester : ${item.semester.nameSemester}',
                      style: appTheme.caption(context),
                    ),
                  ],
                ),
                leading: CircleAvatar(
                  backgroundImage: MemoryImage(
                    base64.decode(item.dosen.imageDosen),
                  ),
                ),
              ),
            );
          },
        );
      },
    );
  }
}
