// ignore_for_file: public_member_api_docs, sort_constructors_first
class Notes {
  final int id;
  final String title;
  final String description;
  final DateTime createdAt;
  final DateTime? completionDate;

  Notes({
    required this.id,
    required this.title,
    this.description = '',
    required this.createdAt,
    this.completionDate,
  });

  bool get isCompleted => completionDate != null;

  Notes copyWith({
    int? id,
    String? title,
    String? description,
    DateTime? createdAt,
    DateTime? completionDate,
  }) {
    return Notes(
      id: id ?? this.id,
      title: title ?? this.title,
      description: description ?? this.description,
      createdAt: createdAt ?? this.createdAt,
      completionDate: completionDate ?? this.completionDate,
    );
  }
}
