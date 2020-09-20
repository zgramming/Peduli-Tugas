import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:my_network/my_network.dart';
import 'package:global_template/global_template.dart';

import '../../screens/detail_dosen_screen.dart';

class HomeScreenSelectedPageView extends StatelessWidget {
  const HomeScreenSelectedPageView({
    Key key,
    @required Animation<double> scaleAnimation,
    @required this.result,
  })  : _scaleAnimation = scaleAnimation,
        super(key: key);

  final Animation<double> _scaleAnimation;
  final DosenModel result;

  @override
  Widget build(BuildContext context) {
    return ScaleTransition(
      scale: _scaleAnimation,
      child: Stack(
        fit: StackFit.expand,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(30),
            child: Card(
              child: Hero(
                tag: 'pageview'+result.idDosen.toString(),
                child: Image.memory(
                  base64.decode(result.imageDosen),
                  fit: BoxFit.cover,
                  gaplessPlayback: true,
                ),
              ),
            ),
          ),
          Positioned(
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.vertical(bottom: Radius.circular(20)),
                color: colorPallete.primaryColor,
              ),
              child: Text(
                result.nameDosen,
                maxLines: 1,
                textAlign: TextAlign.center,
                overflow: TextOverflow.ellipsis,
                style: appTheme.caption(context).copyWith(color: colorPallete.white),
              ),
              padding: const EdgeInsets.symmetric(
                vertical: 8.0,
                horizontal: 20.0,
              ),
            ),
            bottom: 0,
            left: 4,
            right: 4,
          ),
          Positioned.fill(
            child: Material(
              color: colorPallete.transparent,
              child: InkWell(
                onTap: () async => await Navigator.of(context).pushNamed(
                  DetailDosenScreen.routeNamed,
                  arguments: result.idDosen,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
