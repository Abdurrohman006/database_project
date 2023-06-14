class MindModel {
  String mind;
  String author;

  MindModel({required this.mind, required this.author});

  factory MindModel.fromJson(Map<String, dynamic> json) {
    return MindModel(
        mind: json["mind"] ?? "Hechnima demagan",
        author: json["author"] ?? "Hechkim");
  }
  toJson() {
    return {
      "mind": mind,
      "author": author,
    };
  }
}
