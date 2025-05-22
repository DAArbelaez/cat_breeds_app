import 'package:cat_breeds_app/features/home/common/data/data_sources/breeds_data_source.dart';
import 'package:cat_breeds_app/features/home/common/data/mappers/cat_breed_mapper.dart';
import 'package:cat_breeds_app/features/home/common/domain/entities/cat_breed_model.dart';
import 'package:cat_breeds_app/features/home/common/domain/repositories/cat_breed_repository.dart';

class CatBreedRepositoryImpl implements CatBreedRepository {
  final BreedsDataSource datasource;

  CatBreedRepositoryImpl(this.datasource);

  @override
  Future<List<CatBreedModel>> searchBreeds(String query) async {
    final dtos = await datasource.searchBreeds(query);
    return dtos.map((dto) => dto.toDomain()).toList();
  }
}
