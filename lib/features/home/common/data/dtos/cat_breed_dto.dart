class CatBreedDTO {
  final String id;
  final String name;
  final String origin;
  final String weightMetric;
  final String lifeSpan;
  final int intelligence;
  final List<String> temperament;
  final String imageUrl;
  final String description;

  CatBreedDTO({
    required this.id,
    required this.name,
    required this.origin,
    required this.weightMetric,
    required this.lifeSpan,
    required this.intelligence,
    required this.temperament,
    required this.imageUrl,
    required this.description,
  });

  factory CatBreedDTO.fromJson(Map<String, dynamic> json) {
    return CatBreedDTO(
      id: json['id'] as String,
      name: json['name'] as String,
      origin: json['origin'] as String,
      weightMetric: (json['weight']['metric'] as String).trim(),
      lifeSpan: (json['life_span'] as String).trim(),
      intelligence: json['intelligence'] as int,
      temperament: (json['temperament'] as String).split(',').map((s) => s.trim()).toList(),
      imageUrl: 'https://cdn2.thecatapi.com/images/${json['reference_image_id']}.jpg',
      description: (json['description'] as String).trim(),
    );
  }
}
