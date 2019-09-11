import 'package:flutter/cupertino.dart';

class Colors {
  static Color colorFF68B7CE = new Color(0xFF68B7CE);
  static Color colorFF37EBBB = new Color(0xFF37EBBB);
  static final BoxDecoration decorationShape = new BoxDecoration(
      border: Border.all(color: new Color(0xFFD0BBFF), width: 0.5),
      color: new Color(0xFF7F57DB),
      boxShadow: [
        BoxShadow(
            color: new Color(0xFFD0BBFF),
            offset: new Offset(0, 0),
            blurRadius: 10.0,
            spreadRadius: -8.0),
      ],
      borderRadius: BorderRadius.all(Radius.circular(8)));

  static final BoxDecoration decorationRed = new BoxDecoration(
    // border: Border.all(color: UIHelp.color_7F57DB, width: 0.5),
      color: new Color(0xFFFA595F),
      boxShadow: [
        BoxShadow(
            color: new Color(0xFFFA595F),
            offset: new Offset(0, 0),
            blurRadius: 20.0,
            spreadRadius: -8.0),
      ],
      borderRadius: BorderRadius.only(
          topLeft: Radius.circular(8),
          topRight: Radius.circular(8),
          bottomRight: Radius.circular(8)));
  static Border border = Border.all(color: Color(0xFF68B7CE), width: 0.5);
}
