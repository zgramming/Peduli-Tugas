import 'package:flutter/material.dart';
import 'package:my_network/my_network.dart';
import 'package:global_template/global_template.dart';

import '../../screens/tugas_by_pelajaran_screen.dart';

class DetailDosenGridView extends StatelessWidget {
  final List<PelajaranModel> valueMap;
  DetailDosenGridView({@required this.valueMap});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      itemCount: valueMap.length,
      physics: NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        crossAxisSpacing: 5,
        mainAxisSpacing: 5,
      ),
      itemBuilder: (context, index) {
        final result = valueMap[index];
        return Stack(
          children: [
            Card(
              color: GlobalFunction.getRandomColor(),
              child: DefaultTextStyle(
                style: appTheme.caption(context).copyWith(color: colorPallete.white),
                child: GridTile(
                  child: FittedBox(
                    child: Center(
                      child: Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: Text(
                          GlobalFunction.getFirstCharacterErveryWord(
                            string: result.namePelajaran,
                            limitTo: 3,
                          ),
                        ),
                      ),
                    ),
                  ),
                  header: FittedBox(
                    child: Padding(
                      padding: const EdgeInsets.only(top: 8.0, left: 16.0, right: 16.0),
                      child: Text(result.namePelajaran, textAlign: TextAlign.center),
                    ),
                  ),
                ),
              ),
            ),
            Positioned.fill(
              child: Material(
                color: colorPallete.transparent,
                child: InkWell(
                  borderRadius: BorderRadius.circular(20),
                  splashColor: colorPallete.accentColor.withOpacity(.8),
                  onTap: () {
                    Navigator.of(context).pushNamed(
                      TugasByPelajaranScreen.routeNamed,
                      arguments: result,
                    );
                  },
                ),
              ),
            )
          ],
        );
      },
    );
  }
}
