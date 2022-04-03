
class DataModel {

  final String title;

  DataModel({required this.title});

  factory DataModel.fromJson(Map<String, dynamic> json) {
    return DataModel(
      title: json['title'] ?? "",
    
    );
  }
}