import 'package:cat_breeds_app/core/network/api_client.dart';
import 'package:cat_breeds_app/features/home/data/data_sources/breeds_data_source.dart';
import 'package:cat_breeds_app/features/home/data/repositories/cat_breed_repository_impl.dart';
import 'package:cat_breeds_app/features/home/domain/use_cases/get_cat_breeds_use_case.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final http = Provider<ApiClient>((ref) {
  const apiKey = String.fromEnvironment('CAT_API_KEY');
  return ApiClientImpl(
      baseUrl: 'https://api.thecatapi.com/v1', apiKey: apiKey,
  );
});

final _dataSource = Provider.autoDispose((ref) => BreedsDataSourceImpl(ref.read(http)));

final _repository = Provider.autoDispose((ref) => CatBreedRepositoryImpl(ref.read(_dataSource)));

final getBreedsUseCase = Provider.autoDispose((ref) => GetCatBreedsUseCase(ref.read(_repository)));
