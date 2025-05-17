import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_quill/quill_delta.dart';
import '../../../../model/note.dart';
import 'note_event.dart';
import 'note_state.dart';

class NoteBloc extends Bloc<NoteEvent, NoteState> {
  List<Note> _notes = [];
  Note? _selectedNote;

  NoteBloc() : super(NoteInitial()) {
    on<LoadNotes>(_onLoadNotes);
    on<AddNote>(_onAddNote);
    on<UpdateNote>(_onUpdateNote);
    on<DeleteNote>(_onDeleteNote);
    on<SelectNote>(_onSelectNote);
  }

  void _onLoadNotes(LoadNotes event, Emitter<NoteState> emit) async {
    try {
      emit(NotesLoading());
      // TODO: Implement actual loading from storage/database
      emit(NotesLoaded(notes: _notes, selectedNote: _selectedNote));
    } catch (e) {
      emit(NoteError(e.toString()));
    }
  }

  void _onAddNote(AddNote event, Emitter<NoteState> emit) async {
    try {
      final note = Note(
        id: _notes.length + 1,
        note: Delta(),
        createdAt: DateTime.now(),
      );
      _notes = [..._notes, note];
      emit(NotesLoaded(notes: _notes, selectedNote: _selectedNote));
    } catch (e) {
      emit(NoteError(e.toString()));
    }
  }

  void _onUpdateNote(UpdateNote event, Emitter<NoteState> emit) async {
    try {
      // _notes =
      //     _notes.map((note) {
      //       return note.id == event.note.id ? event.note : note;
      //     }).toList();

      // if (_selectedNote?.id == event.note.id) {
      //   _selectedNote = event.note;
      // }

      emit(NotesLoaded(notes: _notes, selectedNote: _selectedNote));
    } catch (e) {
      emit(NoteError(e.toString()));
    }
  }

  void _onDeleteNote(DeleteNote event, Emitter<NoteState> emit) async {
    try {
      _notes = _notes.where((note) => note.id != event.id).toList();

      if (_selectedNote?.id == event.id) {
        _selectedNote = null;
      }

      emit(NotesLoaded(notes: _notes, selectedNote: _selectedNote));
    } catch (e) {
      emit(NoteError(e.toString()));
    }
  }

  void _onSelectNote(SelectNote event, Emitter<NoteState> emit) async {
    try {
      _selectedNote = event.note;
      emit(NotesLoaded(notes: _notes, selectedNote: _selectedNote));
    } catch (e) {
      emit(NoteError(e.toString()));
    }
  }
}
