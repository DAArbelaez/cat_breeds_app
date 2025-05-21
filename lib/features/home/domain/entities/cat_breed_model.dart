class CatBreedModel {
  final String id;
  final String name;
  final String origin;
  final String weightMetric;
  final String lifeSpan;
  final int intelligence;
  final List<String> temperament;
  final String imageUrl;

  const CatBreedModel({
    required this.id,
    required this.name,
    required this.origin,
    required this.weightMetric,
    required this.lifeSpan,
    required this.intelligence,
    required this.temperament,
    required this.imageUrl,
  });
}