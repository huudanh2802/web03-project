import 'package:equatable/equatable.dart';
import '../../../../model/note.dart';

abstract class NoteState extends Equatable {
  const NoteState();

  @override
  List<Object?> get props => [];
}

class NoteInitial extends NoteState {}

class NotesLoading extends NoteState {}

class NotesLoaded extends NoteState {
  final List<Note> notes;
  final Note? selectedNote;

  const NotesLoaded({required this.notes, this.selectedNote});

  @override
  List<Object?> get props => [notes, selectedNote];

  NotesLoaded copyWith({List<Note>? notes, Note? selectedNote}) {
    return NotesLoaded(
      notes: notes ?? this.notes,
      selectedNote: selectedNote ?? this.selectedNote,
    );
  }
}

class NoteError extends NoteState {
  final String message;

  const NoteError(this.message);

  @override
  List<Object?> get props => [message];
}
