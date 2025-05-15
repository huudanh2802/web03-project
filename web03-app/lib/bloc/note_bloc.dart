import 'package:flutter_bloc/flutter_bloc.dart';
import '../model/note.dart';
import 'note_event.dart';
import 'note_state.dart';

class NoteBloc extends Bloc<NoteEvent, NoteState> {
  NoteBloc() : super(const NoteInitial()) {
    on<LoadNotes>(_onLoadNotes);
    on<AddNote>(_onAddNote);
    on<UpdateNote>(_onUpdateNote);
    on<DeleteNote>(_onDeleteNote);
    on<SelectNote>(_onSelectNote);
  }

  void _onLoadNotes(LoadNotes event, Emitter<NoteState> emit) async {
    try {
      emit(NotesLoading(notes: state.notes, selectedNote: state.selectedNote));
      // TODO: Implement actual loading from storage/database
      emit(NotesLoaded(notes: state.notes, selectedNote: state.selectedNote));
    } catch (e) {
      emit(
        NoteError(
          e.toString(),
          notes: state.notes,
          selectedNote: state.selectedNote,
        ),
      );
    }
  }

  void _onAddNote(AddNote event, Emitter<NoteState> emit) async {
    try {
      final note = Note(
        id: state.notes.length + 1,
        note: event.content,
        createdAt: DateTime.now(),
      );

      final updatedNotes = [...state.notes, note];
      emit(NotesLoaded(notes: updatedNotes, selectedNote: state.selectedNote));
    } catch (e) {
      emit(
        NoteError(
          e.toString(),
          notes: state.notes,
          selectedNote: state.selectedNote,
        ),
      );
    }
  }

  void _onUpdateNote(UpdateNote event, Emitter<NoteState> emit) async {
    try {
      final updatedNotes =
          state.notes.map((note) {
            return note.id == event.note.id ? event.note : note;
          }).toList();

      final updatedSelectedNote =
          state.selectedNote?.id == event.note.id
              ? event.note
              : state.selectedNote;

      emit(NotesLoaded(notes: updatedNotes, selectedNote: updatedSelectedNote));
    } catch (e) {
      emit(
        NoteError(
          e.toString(),
          notes: state.notes,
          selectedNote: state.selectedNote,
        ),
      );
    }
  }

  void _onDeleteNote(DeleteNote event, Emitter<NoteState> emit) async {
    try {
      final updatedNotes =
          state.notes.where((note) => note.id != event.id).toList();
      final updatedSelectedNote =
          state.selectedNote?.id == event.id ? null : state.selectedNote;

      emit(NotesLoaded(notes: updatedNotes, selectedNote: updatedSelectedNote));
    } catch (e) {
      emit(
        NoteError(
          e.toString(),
          notes: state.notes,
          selectedNote: state.selectedNote,
        ),
      );
    }
  }

  void _onSelectNote(SelectNote event, Emitter<NoteState> emit) async {
    try {
      emit(NotesLoaded(notes: state.notes, selectedNote: event.note));
    } catch (e) {
      emit(
        NoteError(
          e.toString(),
          notes: state.notes,
          selectedNote: state.selectedNote,
        ),
      );
    }
  }
}
