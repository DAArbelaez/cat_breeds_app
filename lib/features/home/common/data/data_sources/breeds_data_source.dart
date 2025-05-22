import 'package:cat_breeds_app/core/network/api_client.dart';
import 'package:cat_breeds_app/features/home/common/data/dtos/cat_breed_dto.dart';

abstract class BreedsDataSource {
  Future<List<CatBreedDTO>> searchBreeds(String query);
}

class BreedsDataSourceImpl implements BreedsDataSource {
  final ApiClient client;

  BreedsDataSourceImpl(this.client);

  @override
  Future<List<CatBreedDTO>> searchBreeds(String query) async {
    final isEmpty = query.trim().isEmpty;
    final path = isEmpty ? 'breeds' : 'breeds/search';
    final params = isEmpty ? null : {'q': query};

    final raw = await client.request<List<dynamic>>(
      path,
      method: HttpMethod.get,
      queryParams: params,
    );

    return raw.map((e) => CatBreedDTO.fromJson(e as Map<String, dynamic>)).toList();
  }
}
