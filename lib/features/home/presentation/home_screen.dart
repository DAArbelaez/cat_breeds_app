import 'package:cat_breeds_app/core/constants/app_constants.dart';
import 'package:cat_breeds_app/core/constants/dimens.dart';
import 'package:cat_breeds_app/core/navigation/go_router.dart';
import 'package:cat_breeds_app/core/navigation/routes.dart';
import 'package:cat_breeds_app/features/common/widgets/custom_appbar/custom_appbar.dart';
import 'package:cat_breeds_app/features/common/widgets/input_search.dart';
import 'package:cat_breeds_app/features/home/presentation/controller/home_controller.dart';
import 'package:cat_breeds_app/features/home/presentation/widgets/cat_breed_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final asyncBreeds = ref.watch(homeControllerProvider);

    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        appBar: const CustomAppbar(),
        body: Padding(
          padding: kPagePadding,
          child: Column(
            children: [
              InputSearch(
                onSearchChanged: (value) {
                  ref.read(homeControllerProvider.notifier).search(value);
                },
                hintText: 'Search for a breed',
              ),
              const SizedBox(height: Dimens.d16),
              Expanded(
                child: asyncBreeds.when(
                  loading: () => const Center(child: CircularProgressIndicator()),
                  error: (err, _) => Center(child: Text('Error: $err')),
                  data: (breeds) {
                    if (breeds.isEmpty) {
                      return const Center(child: Text('No breeds found.'));
                    }
                    return ListView.builder(
                      itemCount: breeds.length,
                      itemBuilder: (context, index) {
                        final breed = breeds[index];
                        return CatBreedCard(
                          catBreed: breed,
                          onMoreInfoPressed: () {
                            ref.read(goRouterProvider).pushNamed(
                                Routes.details.name,
                                pathParameters: {'id': breed.id}, extra: breed,
                            );
                          },
                        );
                      },
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
