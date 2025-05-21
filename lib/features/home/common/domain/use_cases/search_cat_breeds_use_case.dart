import 'package:cat_breeds_app/core/error/errors_handler.dart';
import 'package:cat_breeds_app/features/home/common/domain/entities/cat_breed_model.dart';
import 'package:cat_breeds_app/features/home/common/domain/repositories/cat_breed_repository.dart';

class SearchCatBreedsUseCase {
  final CatBreedRepository repository;

  SearchCatBreedsUseCase(this.repository);

  Future<List<CatBreedModel>> call({String query = ''}) {
    try {
      return repository.searchBreeds(query);
    } catch (e) {
      ErrorsHandler.handleError(error: e, functionName: 'SearchCatBreedsUseCase');
      rethrow;
    }
  }
}
