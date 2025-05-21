import 'package:cat_breeds_app/core/constants/dimens.dart';
import 'package:cat_breeds_app/core/constants/icons.dart';
import 'package:cat_breeds_app/core/constants/text_styles.dart';
import 'package:cat_breeds_app/features/common/widgets/cat_breeds_logo.dart';
import 'package:flutter/material.dart';

class CustomAppbar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppbar({super.key});

  /// Use the Appbar from flutter to set Appbar height
  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    bool canPop = Navigator.canPop(context);
    return SafeArea(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: Dimens.d20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Visibility(
                  visible: canPop,
                  child: IconButton(
                    constraints: const BoxConstraints(minHeight: Dimens.d0),
                    padding: const EdgeInsets.fromLTRB(Dimens.d0, Dimens.d0, Dimens.d8, Dimens.d4),
                    splashColor: Colors.transparent,
                    onPressed: () {
                      if (canPop) {
                        Navigator.pop(context);
                      }
                    },
                    icon: AppIcons.backArrow,
                  ),
                ),
                CatBreedsLogo(size: Dimens.d25),
                const SizedBox(width: Dimens.d8),
                Text('Cat Breeds', style: AppTextStyle.bodyMedium.copyWith(fontWeight: FontWeight.w700)),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
