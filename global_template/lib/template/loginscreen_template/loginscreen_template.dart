import 'package:flutter/material.dart';
import 'package:global_template/global_template.dart';

class LoginScreenTemplate extends StatelessWidget {
  final Widget backgroundImage;
  final Widget logo;
  final List<Widget> form;
  final CopyRightVersion copyRightVersion;
  final EdgeInsetsGeometry formPadding;
  final EdgeInsetsGeometry formMargin;
  final EdgeInsetsGeometry outsideFormMargin;
  final EdgeInsetsGeometry logoPadding;
  final AlignmentGeometry formAlignment;
  final Color formColor;
  final Color headerColor;

  LoginScreenTemplate({
    this.logo,
    this.formPadding,
    this.formMargin,
    this.formAlignment = Alignment.center,
    this.outsideFormMargin,
    this.formColor,
    this.logoPadding,
    this.headerColor = Colors.transparent,
    @required this.form,
    @required this.backgroundImage,
    @required this.copyRightVersion,
  });
  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: <Widget>[
        Positioned.fill(child: backgroundImage),
        SizedBox(
          height: sizes.height(context),
          child: Padding(
            padding: EdgeInsets.only(
              top: sizes.statusBarHeight(context),
              bottom: sizes.statusBarHeight(context) * 2,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Container(
                  color: headerColor,
                  constraints: BoxConstraints(
                    minHeight: sizes.height(context) / 6,
                    maxHeight: sizes.height(context) / 4,
                  ),
                  child: Padding(
                    padding: logoPadding ?? const EdgeInsets.all(8.0),
                    child: logo ?? FlutterLogo(size: sizes.width(context) / 3.5),
                  ),
                ),
                Expanded(
                  child: Container(
                    alignment: formAlignment,
                    margin: outsideFormMargin,
                    child: SingleChildScrollView(
                      child: Card(
                        color: formColor ?? colorPallete.white,
                        margin: formMargin ?? const EdgeInsets.all(14.0),
                        child: Padding(
                          padding: formPadding ?? const EdgeInsets.all(14.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: form,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        Positioned(
          bottom: 0,
          left: 0,
          right: 0,
          child: copyRightVersion,
        )
      ],
    );
  }
}

class LoginButtonGroup extends StatelessWidget {
  final Function onTapButton1;
  final Function onTapButton2;

  final String textButton1;
  final String textButton2;

  LoginButtonGroup({
    @required this.onTapButton1,
    @required this.onTapButton2,
    this.textButton1,
    this.textButton2,
  });
  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Flexible(
          fit: FlexFit.tight,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: FlatButton(
              child: FittedBox(child: Text(textButton1 ?? 'Button 1')),
              onPressed: onTapButton1 ?? () {},
            ),
          ),
        ),
        Flexible(
          fit: FlexFit.tight,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: FlatButton(
              child: FittedBox(child: Text(textButton2 ?? 'Button 2')),
              onPressed: onTapButton2 ?? () {},
            ),
          ),
        ),
      ],
    );
  }
}
