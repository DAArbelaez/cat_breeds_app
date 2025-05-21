import 'package:cat_breeds_app/core/constants/app_constants.dart';
import 'package:cat_breeds_app/core/constants/dimens.dart';
import 'package:cat_breeds_app/core/constants/text_styles.dart';
import 'package:cat_breeds_app/core/constants/icons.dart';
import 'package:cat_breeds_app/core/constants/palette.dart';
import 'package:cat_breeds_app/features/common/widgets/custom_appbar/custom_appbar.dart';
import 'package:cat_breeds_app/features/common/widgets/network_image_loader.dart';
import 'package:cat_breeds_app/features/home/common/domain/entities/cat_breed_model.dart';
import 'package:cat_breeds_app/features/home/common/presentation/widgets/stat_item.dart';
import 'package:flutter/material.dart';

class CatBreedDetailsScreen extends StatelessWidget {
  const CatBreedDetailsScreen({super.key, required this.breedId, required this.catBreed});

  final String breedId;
  final CatBreedModel catBreed;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppbar(),
      body: Padding(
        padding: kPagePadding,
        child: Column(
          children: [
            Expanded(
              child: SizedBox(
                width: double.infinity,
                child: NetworkImageLoader(imageUrl: catBreed.imageUrl, borderRadius: BorderRadius.circular(Dimens.d12)),
              ),
            ),
            const SizedBox(height: Dimens.d16),
            Expanded(
              child: ListView(
                children: [
                  Center(
                    child: Column(
                      children: [
                        Text(catBreed.name, style: AppTextStyle.headlineSmall),
                        const SizedBox(height: Dimens.d4),
                        Text(catBreed.origin, style: AppTextStyle.bodyMedium),
                      ],
                    ),
                  ),
                  const SizedBox(height: Dimens.d16),
                  Wrap(
                    alignment: WrapAlignment.spaceAround,
                    children: [
                      StatItem(
                        icon: AppIcons.intelligence,
                        label: '${catBreed.intelligence}',
                        caption: 'Intelligence',
                        direction: Axis.vertical,
                        spacing: Dimens.d4,
                      ),
                      StatItem(
                        icon: AppIcons.monitorWeight,
                        label: '${catBreed.weightMetric} Kg',
                        caption: 'Weight',
                        direction: Axis.vertical,
                        spacing: Dimens.d4,
                      ),
                      StatItem(
                        icon: AppIcons.favorite,
                        label: '${catBreed.lifeSpan} Years',
                        caption: 'Life span',
                        direction: Axis.vertical,
                        spacing: Dimens.d4,
                      ),
                    ],
                  ),
                  const SizedBox(height: Dimens.d16),
                  Text('Temperament', style: AppTextStyle.titleMedium),
                  const SizedBox(height: Dimens.d8),
                  Wrap(
                    spacing: Dimens.d8,
                    runSpacing: Dimens.d4,
                    children:
                        catBreed.temperament.map((trait) {
                          return Chip(
                            label: Text(trait, style: AppTextStyle.bodySmall),
                            backgroundColor: Palette.greyLight,
                            visualDensity: VisualDensity.compact,
                          );
                        }).toList(),
                  ),
                  const SizedBox(height: Dimens.d16),
                  Text('Description', style: AppTextStyle.titleMedium),
                  const SizedBox(height: Dimens.d8),
                  Text(catBreed.description, style: AppTextStyle.bodyMedium, textAlign: TextAlign.justify),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
