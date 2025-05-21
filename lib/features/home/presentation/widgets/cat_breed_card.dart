import 'package:cat_breeds_app/core/constants/dimens.dart';
import 'package:cat_breeds_app/core/constants/icons.dart';
import 'package:cat_breeds_app/core/constants/palette.dart';
import 'package:cat_breeds_app/core/constants/text_styles.dart';
import 'package:cat_breeds_app/features/common/widgets/network_image_loader.dart';
import 'package:cat_breeds_app/features/home/common/domain/entities/cat_breed_model.dart';
import 'package:cat_breeds_app/features/home/common/presentation/widgets/stat_item.dart';
import 'package:cat_breeds_app/features/home/presentation/widgets/scrollable_chip_row.dart';
import 'package:flutter/material.dart';

class CatBreedCard extends StatelessWidget {
  const CatBreedCard({super.key, required this.catBreed, required this.onMoreInfoPressed});

  final CatBreedModel catBreed;
  final VoidCallback onMoreInfoPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: Dimens.d8),
      decoration: BoxDecoration(
        color: Palette.white,
        borderRadius: BorderRadius.circular(Dimens.d8),
        border: Border.all(color: Palette.greyLight),
        boxShadow: [
          BoxShadow(color: Palette.greyLight, blurRadius: Dimens.d4, offset: const Offset(Dimens.d0, Dimens.d2)),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(Dimens.d16),
        child: Column(
          children: [
            Text(catBreed.name, style: AppTextStyle.titleMedium),
            const SizedBox(height: Dimens.d4),
            Text(catBreed.origin, style: AppTextStyle.bodySmall),
            const SizedBox(height: Dimens.d4),

            NetworkImageLoader(
              imageUrl: catBreed.imageUrl,
              size: Dimens.d200,
              borderRadius: BorderRadius.circular(Dimens.d8),
            ),

            const SizedBox(height: Dimens.d12),

            // Stats: weight, lifespan, intelligence
            Row(
              spacing: Dimens.d12,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Tooltip(
                  message: 'Weight: ${catBreed.weightMetric} Kg',
                  child: StatItem(icon: AppIcons.monitorWeight, label: catBreed.weightMetric, caption: 'Kg'),
                ),
                Tooltip(
                  message: 'Lifespan: ${catBreed.lifeSpan}',
                  child: StatItem(icon: AppIcons.favorite, label: catBreed.lifeSpan, caption: 'Years'),
                ),
                Tooltip(
                  message: 'Intelligence: ${catBreed.intelligence}',
                  child: StatItem(icon: AppIcons.intelligence, label: '${catBreed.intelligence}'),
                ),
              ],
            ),

            const SizedBox(height: Dimens.d12),

            // Temperament chips
            ScrollableChipRow(
              items: catBreed.temperament,
              textStyle: AppTextStyle.bodySmall,
              chipColor: Palette.greyLight,
              height: Dimens.d32,
              chipSpacing: Dimens.d8,
            ),

            const SizedBox(height: Dimens.d16),

            Align(
              alignment: Alignment.centerRight,
              child: TextButton(
                onPressed: onMoreInfoPressed,
                style: TextButton.styleFrom(
                  backgroundColor: Palette.primary,
                  padding: const EdgeInsets.symmetric(horizontal: Dimens.d16, vertical: Dimens.d8),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(Dimens.d8)),
                ),
                child: Text('More info', style: AppTextStyle.buttonSmall.copyWith(color: Palette.white)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
