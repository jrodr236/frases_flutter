class FraseModel {
  final String quote;
  final String author;

  FraseModel({
    required this.quote,
    required this.author,
  });

  // Converteix el JSON de l'API en un objecte FraseModel
  factory FraseModel.fromJson(Map<String, dynamic> json) {
    return FraseModel(
      quote: json['quote'] ?? '',
      author: json['author'] ?? 'Autor desconegut',
    );
  }
}