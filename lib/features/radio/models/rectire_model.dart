class RectireModel {
  final String name;
  final String server;

  RectireModel({required this.name, required this.server});

  factory RectireModel.fromJson(Map<String, dynamic> json) {
    return RectireModel(
      name: json['name'] ?? 'Unknown Reciter',
      server: json['server'] ?? 'Unknown Server',
    );
  }
}