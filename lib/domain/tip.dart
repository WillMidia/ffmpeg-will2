class Tip {
  final String category;
  final String title;
  final String student;
  final String description;

  Tip({
    required this.category,
    required this.title,
    required this.student,
    required this.description,
  });

  Map<String, dynamic> toJson() {
    return {
      'category': category,
      'title': title,
      'student': student,
      'description': description,
    };
  }

  factory Tip.fromJson(Map<String, dynamic> json) {
    return Tip(
      category: json['category'],
      title: json['title'],
      student: json['student'],
      description: json['description'],
    );
  }
}
