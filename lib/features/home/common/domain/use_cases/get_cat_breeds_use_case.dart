import 'package:cat_breeds_app/core/error/errors_handler.dart';
import 'package:cat_breeds_app/features/home/common/domain/entities/cat_breed_model.dart';
import 'package:cat_breeds_app/features/home/common/domain/repositories/cat_breed_repository.dart';

class GetCatBreedsUseCase {
  final CatBreedRepository repository;

  GetCatBreedsUseCase(this.repository);

  Future<List<CatBreedModel>> call() {
    try {
      return repository.getBreeds();
    } catch (e) {
      ErrorsHandler.handleError(error: e, functionName: 'GetCatBreedsUseCase');
      rethrow;
    }
  }
}
