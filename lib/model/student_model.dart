class StudentModel {
  int? id;
  String? name;
  String? grade;
  String section;
  String? image;

  StudentModel({
    required this.id,
    required this.name,
    required this.grade,
    required this.section,
    required this.image,
  });

  factory StudentModel.fromMap(Map<String, dynamic> json) => StudentModel(
        id: json["id"],
        name: json["name"],
        grade: json["grade"],
        section: json["section"],
        image: json["image"],
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "name": name,
        "grade": grade,
        "section": section,
        "image": image,
      };
}
