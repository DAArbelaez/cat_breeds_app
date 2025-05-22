import 'package:cat_breeds_app/core/constants/image_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CatBreedsLogo extends StatelessWidget {
  const CatBreedsLogo({super.key, this.size = 50});

  final double size;

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      kCatBreedsLogo,
      height: size,
    );
  }
}
