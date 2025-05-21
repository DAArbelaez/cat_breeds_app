import 'package:cat_breeds_app/features/home/common/domain/entities/cat_breed_model.dart';

abstract class CatBreedRepository {
  Future<List<CatBreedModel>> searchBreeds(String query);
}
