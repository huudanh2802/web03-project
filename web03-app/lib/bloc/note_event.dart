import 'package:equatable/equatable.dart';
import '../model/note.dart';

abstract class NoteEvent extends Equatable {
  const NoteEvent();

  @override
  List<Object?> get props => [];
}

class LoadNotes extends NoteEvent {}

class AddNote extends NoteEvent {
  final String content;

  const AddNote(this.content);

  @override
  List<Object?> get props => [content];
}

class UpdateNote extends NoteEvent {
  final Note note;

  const UpdateNote(this.note);

  @override
  List<Object?> get props => [note];
}

class DeleteNote extends NoteEvent {
  final int id;

  const DeleteNote(this.id);

  @override
  List<Object?> get props => [id];
}

class SelectNote extends NoteEvent {
  final Note note;

  const SelectNote(this.note);

  @override
  List<Object?> get props => [note];
}
