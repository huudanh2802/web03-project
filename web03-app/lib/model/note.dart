import 'package:flutter_quill/quill_delta.dart';

class Note {
  final int? id;
  final Delta note;
  final DateTime createdAt;

  Note({this.id, required this.note, required this.createdAt});

  // Convert from JSON
  factory Note.fromJson(Map<String, dynamic> json) {
    return Note(
      id: json['id'] as int?,
      note: Delta.fromJson(json['note'] as List<dynamic>),
      createdAt: DateTime.parse(json['createdAt'] as String),
    );
  }

  // Convert to JSON
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'note': note.toJson(),
      'createdAt': createdAt.toIso8601String(),
    };
  }

  // Create a copy of the note with optional new values
  Note copyWith({int? id, Delta? note, DateTime? createdAt}) {
    return Note(
      id: id ?? this.id,
      note: note ?? this.note,
      createdAt: createdAt ?? this.createdAt,
    );
  }
}
