import 'package:flutter/material.dart';
import 'package:global_template/global_template.dart';

import './detailtugas_content_description.dart';
import './detailtugas_content_leftinfo.dart';
import './detailtugas_content_rightinfo.dart';
import './detailtugas_content_title.dart';

class DetailTugasContent extends StatelessWidget {
  const DetailTugasContent({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      child: Container(
        decoration: BoxDecoration(
          color: colorPallete.white,
          borderRadius: BorderRadius.vertical(top: Radius.circular(60)),
          boxShadow: [
            BoxShadow(offset: Offset(0, 0), color: Colors.black45, blurRadius: 2),
          ],
        ),
        padding: const EdgeInsets.all(15.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              DetailTugasContentTitle(),
              SizedBox(height: 10),
              DetailTugasContentDescription(),
              SizedBox(height: 20),
              Row(
                children: [
                  DetailTugasContentLeftInfo(),
                  DetailTugasContentRightInfo(),
                ],
              ),
              SizedBox(height: kToolbarHeight),
            ],
          ),
        ),
      ),
      left: 0,
      right: 0,
      bottom: 0,
      top: sizes.height(context) / 5,
    );
  }
}
