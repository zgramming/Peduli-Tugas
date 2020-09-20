import 'package:flutter/material.dart';
import 'package:my_provider/my_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import './grouped_dosen_image.dart';
import './grouped_dosen_firstletter.dart';

class GroupedDosen extends StatelessWidget {
  const GroupedDosen({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Consumer(builder: (ctx, watch, _) {
          final dosen = watch(groupedDosen);
          if (dosen == null || dosen.isEmpty) {
            return Center(child: Text('Dosen Tidak Ditemukan'));
          }
          return Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisSize: MainAxisSize.min,
            children: dosen
                .map(
                  (key, value) => MapEntry(
                    key,
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        GroupedDosenFirstLetter(key),
                        SizedBox(height: 10),
                        GridView.builder(
                          itemCount: value.length,
                          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 3,
                            crossAxisSpacing: 20,
                            mainAxisSpacing: 20,
                            childAspectRatio: 2 / 3,
                          ),
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          itemBuilder: (context, index) {
                            final result = value[index];
                            return GroupedDosenImage(result: result);
                          },
                        ),
                        SizedBox(height: 10),
                      ],
                    ),
                  ),
                )
                .values
                .toList(),
          );
        }),
      ),
    );
  }
}
