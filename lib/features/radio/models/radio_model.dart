class RadioModel {
  final String radioName;
  final String radioUrl;

  RadioModel({required this.radioName, required this.radioUrl});

  factory RadioModel.fromJson(Map<String, dynamic> json) {
    return RadioModel(
      radioName: json['name'] ?? 'Unknown Radio', 
      radioUrl: json['url'] ?? '',
    );
  }
}