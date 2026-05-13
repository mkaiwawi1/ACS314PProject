class MyPending {
  String id;
  String lessonName;
  String lessonDesc;
  String dueDate;
  String image;
  MyPending({
    required this.id,
    required this.lessonName,
    required this.lessonDesc,
    required this.dueDate,
    required this.image,
  });

  factory MyPending.fromJson(Map<String, dynamic> json) {
    return MyPending(
      id: json['ID'].toString(),
      lessonName: json['lesson_name'] ?? '',
      lessonDesc: json['lesson_desc'] ?? '',
      dueDate: json['due_date'] ?? '',
      image: json['image'] ?? '',
    );
  }
}
