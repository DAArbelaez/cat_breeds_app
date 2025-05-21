import 'package:cat_breeds_app/features/home/data/dtos/cat_breed_dto.dart';
import 'package:cat_breeds_app/features/home/domain/entities/cat_breed_model.dart';

extension CatBreedDTOMapper on CatBreedDTO {
  CatBreedModel toDomain() => CatBreedModel(
    id: id,
    name: name,
    origin: origin,
    weightMetric: weightMetric,
    lifeSpan: lifeSpan,
    intelligence: intelligence,
    temperament: temperament,
    imageUrl: imageUrl,
  );
}
