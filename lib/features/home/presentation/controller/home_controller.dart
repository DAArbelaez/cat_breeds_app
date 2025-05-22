import 'package:cat_breeds_app/features/home/common/domain/entities/cat_breed_model.dart';
import 'package:cat_breeds_app/providers/home_providers.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'home_controller.g.dart';

@riverpod
class HomeController extends _$HomeController {
  @override
  Future<List<CatBreedModel>> build() async {
    return ref.read(searchBreedsUseCase).call();
  }

  Future<void> search(String query) async {
    state = const AsyncLoading();

    try {
      final results = await ref.read(searchBreedsUseCase).call(query: query);

      state = AsyncData(results);
    } catch (e, st) {
      state = AsyncError(e, st);
    }
  }
}
