class DogModel {
  final String image;

  DogModel({
    required this.image,
  });

  factory DogModel.fromJson(Map<String, dynamic> json) {
    return DogModel(
      image: json['url'],
    );
  }
}