import 'package:equatable/equatable.dart';
import '../model/note.dart';

abstract class NoteState extends Equatable {
  final List<Note> notes;
  final Note? selectedNote;

  const NoteState({this.notes = const [], this.selectedNote});

  @override
  List<Object?> get props => [notes, selectedNote];
}

class NoteInitial extends NoteState {
  const NoteInitial() : super(notes: const [], selectedNote: null);
}

class NotesLoading extends NoteState {
  const NotesLoading({required super.notes, super.selectedNote});
}

class NotesLoaded extends NoteState {
  const NotesLoaded({required super.notes, super.selectedNote});

  NotesLoaded copyWith({
    List<Note>? notes,
    Note? selectedNote,
    bool clearSelectedNote = false,
  }) {
    return NotesLoaded(
      notes: notes ?? this.notes,
      selectedNote:
          clearSelectedNote ? null : (selectedNote ?? this.selectedNote),
    );
  }
}

class NoteError extends NoteState {
  final String message;

  const NoteError(this.message, {required super.notes, super.selectedNote});

  @override
  List<Object?> get props => [...super.props, message];
}
