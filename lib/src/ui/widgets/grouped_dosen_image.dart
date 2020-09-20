import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:my_network/my_network.dart';
import 'package:my_provider/my_provider.dart';
import 'package:global_template/global_template.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:peduli_tugas/src/function/functions.dart';

import '../../function/crud_function.dart';

import '../screens/detail_dosen_screen.dart';
import '../screens/form_dosen_screen.dart';

class GroupedDosenImage extends StatelessWidget {
  const GroupedDosenImage({
    Key key,
    @required this.result,
  }) : super(key: key);

  final DosenModel result;

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        Container(
          decoration: BoxDecoration(
            color: colorPallete.backgroundColor,
            boxShadow: [
              BoxShadow(
                offset: Offset(0, 0),
                blurRadius: 2,
                spreadRadius: 0,
                color: Colors.black26,
              )
            ],
            borderRadius: BorderRadius.circular(20),
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Image.memory(
              base64.decode(result.imageDosen),
              fit: BoxFit.cover,
            ),
          ),
        ),
        Positioned.fill(
          child: Material(
            color: colorPallete.transparent,
            child: InkWell(
              borderRadius: BorderRadius.circular(20),
              splashColor: colorPallete.primaryColor.withOpacity(.5),
              onTap: () => showModalBottomSheet(
                context: context,
                builder: (context) => ActionModalBottomSheet(
                  children: [
                    ActionCircleButton(
                      icon: Icons.remove_red_eye,
                      backgroundColor: Colors.lightBlue,
                      foregroundColor: colorPallete.white,
                      onTap: () => Navigator.of(context).pushNamed(
                        DetailDosenScreen.routeNamed,
                        arguments: result.idDosen,
                      ),
                    ),
                  ],
                  onEdit: () {
                    context.read(DosenModelEdit).state = result;
                    Navigator.of(context).pushNamed(FormDosenScreen.routeNamed);
                  },
                  onDelete: () => showDialog(
                    context: context,
                    builder: (context) => ConfirmationDeleteDialog(
                      totalNavigatorPop: 2,
                      onDelete: () async {
                        final ctx = context.read(GlobalContext).state;
                        await CRUDFunction.CRUDdeleteDosen(ctx, idDosen: result.idDosen);
                      },
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
        Positioned(
          child: Container(
            height: sizes.height(context) / 30,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.vertical(
                bottom: Radius.circular(20),
                top: Radius.circular(2),
              ),
              color: colorPallete.primaryColor,
            ),
            child: FittedBox(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Text(
                  result.nameDosen,
                  style: appTheme.caption(context).copyWith(color: colorPallete.white),
                ),
              ),
            ),
          ),
          bottom: 0,
          left: 0,
          right: 0,
        ),
      ],
    );
  }
}
