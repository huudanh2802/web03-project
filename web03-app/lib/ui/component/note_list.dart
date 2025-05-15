import 'package:application/model/note.dart';
import 'package:application/ui/component/note_preview.dart';
import 'package:flutter/material.dart';

class NoteList extends StatefulWidget {
  const NoteList({super.key});

  @override
  State<NoteList> createState() => _NoteListState();
}

class _NoteListState extends State<NoteList> {
  int? selectedNoteId;

  // generate sample notes from note
  final List<Note> notes = [
    Note(
      id: 1,
      note: 'Note 22asdlaspdjoqwjidoqiwjdoqwijdoqwijdoiqwjdoiqwjdqwiojdio',
      createdAt: DateTime.now(),
    ),
    Note(id: 2, note: 'Note 2', createdAt: DateTime.now()),
    Note(id: 3, note: 'Note 3', createdAt: DateTime.now()),
    Note(id: 4, note: 'Note 4', createdAt: DateTime.now()),
    Note(id: 5, note: 'Note 5', createdAt: DateTime.now()),
    Note(id: 6, note: 'Note 6', createdAt: DateTime.now()),
    Note(id: 7, note: 'Note 7', createdAt: DateTime.now()),
    Note(id: 8, note: 'Note 8', createdAt: DateTime.now()),
    Note(id: 9, note: 'Note 9', createdAt: DateTime.now()),
    Note(id: 10, note: 'Note 10', createdAt: DateTime.now()),
    Note(id: 11, note: 'Note 11', createdAt: DateTime.now()),
    Note(id: 12, note: 'Note 12', createdAt: DateTime.now()),
    Note(id: 13, note: 'Note 13', createdAt: DateTime.now()),
    Note(id: 14, note: 'Note 14', createdAt: DateTime.now()),
    Note(id: 15, note: 'Note 15', createdAt: DateTime.now()),
    Note(id: 16, note: 'Note 16', createdAt: DateTime.now()),
    Note(id: 17, note: 'Note 17', createdAt: DateTime.now()),
    Note(id: 18, note: 'Note 18', createdAt: DateTime.now()),
    Note(id: 19, note: 'Note 19', createdAt: DateTime.now()),
    Note(id: 20, note: 'Note 20', createdAt: DateTime.now()),
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: notes.length,
      itemBuilder: (context, index) {
        final note = notes[index];
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 4.0),
          child: NotePreview(
            note: note.note,
            date: note.createdAt,
            isSelected: note.id == selectedNoteId,
            onTap: () {
              setState(() {
                selectedNoteId = note.id;
              });
            },
          ),
        );
      },
    );
  }
}
