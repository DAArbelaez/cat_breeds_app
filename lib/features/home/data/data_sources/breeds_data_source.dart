import 'package:cat_breeds_app/core/network/api_client.dart';
import 'package:cat_breeds_app/features/home/data/dtos/cat_breed_dto.dart';

abstract class BreedsDataSource {
  Future<List<CatBreedDTO>> fetchBreeds();
}

class BreedsDataSourceImpl implements BreedsDataSource {
  final ApiClient client;

  BreedsDataSourceImpl(this.client);

  @override
  Future<List<CatBreedDTO>> fetchBreeds() async {
    final raw = await client.request<List<dynamic>>(
      'breeds',
      method: HttpMethod.get,
    );

    return raw.map((e) => CatBreedDTO.fromJson(e as Map<String, dynamic>)).toList();
  }
}
