import 'package:cat_breeds_app/core/constants/dimens.dart';
import 'package:cat_breeds_app/core/constants/text_styles.dart';
import 'package:cat_breeds_app/features/common/widgets/cat_breeds_logo.dart';
import 'package:cat_breeds_app/features/splash/presentation/controller/splash_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SplashScreen extends ConsumerWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.read(splashControllerProvider);
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            CatBreedsLogo(size: Dimens.d120),
            const SizedBox(height: Dimens.d8),
            Text('Cat Breeds', style: AppTextStyle.headlineSmall),
          ],
        ),
      ),
    );
  }
}
