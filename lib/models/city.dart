class City {
  final int id;
  final String city;
  final String name;
  final String image;
  final String country;
  final String description;

  City({
    required this.id,
    required this.city,
    required this.name,
    required this.image,
    required this.country,
    required this.description,
  });

  factory City.fromJson(Map<String, dynamic> json) => City(
        id: json['id'],
        name: json['name'],
        image: json['image'],
        city: json['city'],
        country: json['country'],
        description: json['description'],
      );
}
