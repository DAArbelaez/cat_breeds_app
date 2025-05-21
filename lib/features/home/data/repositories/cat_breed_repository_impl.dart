import 'package:cat_breeds_app/features/home/data/data_sources/breeds_data_source.dart';
import 'package:cat_breeds_app/features/home/data/mappers/cat_breed_mapper.dart';
import 'package:cat_breeds_app/features/home/domain/entities/cat_breed_model.dart';
import 'package:cat_breeds_app/features/home/domain/repositories/cat_breed_repository.dart';

class CatBreedRepositoryImpl implements CatBreedRepository {
  final BreedsDataSource datasource;

  CatBreedRepositoryImpl(this.datasource);

  @override
  Future<List<CatBreedModel>> getBreeds() async {
    final dtos = await datasource.fetchBreeds();
    return dtos.map((dto) => dto.toDomain()).toList();
  }
}
