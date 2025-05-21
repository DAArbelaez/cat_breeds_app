import 'package:cat_breeds_app/features/home/common/domain/entities/cat_breed_model.dart';
import 'package:cat_breeds_app/features/home/home_providers.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'home_controller.g.dart';

@riverpod
class HomeController extends _$HomeController {
  @override
  List<CatBreedModel> build() {
    fetchBreeds();
    return [];
  }

  Future<void> fetchBreeds() async {
    final response = await ref.read(getBreedsUseCase).call();
    state = response;
    print('CATS BREEDS ${response.length}');
  }
}
