import 'dart:convert';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:my_network/my_network.dart';
import 'package:global_template/global_template.dart';

class HomeScreenUnselecPageView extends StatelessWidget {
  const HomeScreenUnselecPageView({
    Key key,
    @required this.result,
  }) : super(key: key);

  final DosenModel result;

  @override
  Widget build(BuildContext context) {
    return Transform.scale(
      scale: .7,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20.0),
        child: Stack(
          fit: StackFit.expand,
          children: [
            Card(
              child: Image.memory(
                base64.decode(result.imageDosen),
                fit: BoxFit.cover,
                gaplessPlayback: true,
              ),
            ),
            Positioned.fill(
              child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 1.5, sigmaY: 1.5),
                  child: Container(
                    margin: const EdgeInsets.all(4.0),
                    color: colorPallete.black.withOpacity(.2),
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
