import 'package:cat_breeds_app/core/constants/dimens.dart';
import 'package:cat_breeds_app/core/constants/palette.dart';
import 'package:flutter/material.dart' show Icon, Icons;

class AppIcons {
  static const arrowBack = Icon(Icons.arrow_back_ios_rounded, color: Palette.textColor, size: Dimens.d20);

  static const arrowForward = Icon(Icons.arrow_forward_ios_rounded , color: Palette.textColor, size: Dimens.d20);

  static const search = Icon(Icons.search, color: Palette.textColor, size: Dimens.d20);

  static const clear = Icon(Icons.clear);

  static const brokenImage = Icon(Icons.broken_image, size: 40, color: Palette.grey);

  static const monitorWeight = Icon(Icons.scale);

  static const favorite = Icon(Icons.favorite);

  static const intelligence = Icon(Icons.psychology);
}
