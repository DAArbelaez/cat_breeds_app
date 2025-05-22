import 'package:flutter/material.dart';
import 'package:cat_breeds_app/core/constants/dimens.dart';
import 'package:cat_breeds_app/core/constants/text_styles.dart';

/// A widget that displays a statistic item with an icon, label, and optional caption.
class StatItem extends StatelessWidget {
  const StatItem({
    super.key,
    required this.icon,
    required this.label,
    this.caption,
    this.direction = Axis.horizontal,
    this.spacing = Dimens.d8,
  });

  final Widget icon;
  final String label;
  final String? caption;
  final Axis direction;
  final double spacing;

  @override
  Widget build(BuildContext context) {
    return Wrap(
      direction: direction,
      crossAxisAlignment: WrapCrossAlignment.center,
      spacing: spacing,
      runSpacing: direction == Axis.vertical ? spacing : Dimens.d0,
      children: [
        icon,
        Text(label, style: AppTextStyle.bodySmall),
        if (caption != null) Text(caption!, style: AppTextStyle.bodySmall),
      ],
    );
  }
}
