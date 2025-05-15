import 'package:equatable/equatable.dart';
import '../../../../model/note.dart';

abstract class NoteEvent extends Equatable {
  const NoteEvent();

  @override
  List<Object?> get props => [];
}

class LoadNotes extends NoteEvent {}

class AddNote extends NoteEvent {
  const AddNote();

  @override
  List<Object?> get props => [];
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
