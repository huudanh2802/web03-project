class Note {
  final int? id;
  final String note;
  final DateTime createdAt;

  Note({this.id, required this.note, required this.createdAt});

  // Convert from JSON
  factory Note.fromJson(Map<String, dynamic> json) {
    return Note(
      id: json['id'] as int?,
      note: json['note'] as String,
      createdAt: DateTime.parse(json['createdAt'] as String),
    );
  }

  // Convert to JSON
  Map<String, dynamic> toJson() {
    return {'id': id, 'note': note, 'createdAt': createdAt.toIso8601String()};
  }

  // Create a copy of the note with optional new values
  Note copyWith({int? id, String? note, DateTime? createdAt}) {
    return Note(
      id: id ?? this.id,
      note: note ?? this.note,
      createdAt: createdAt ?? this.createdAt,
    );
  }
}
