import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_quill/flutter_quill.dart';
import 'package:application/ui/screen/notes/bloc/note_bloc.dart';
import 'package:application/ui/screen/notes/bloc/note_state.dart';

class NoteSearchBar extends StatelessWidget {
  final QuillController controller;

  const NoteSearchBar({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Search notes',
                prefixIcon: const Icon(Icons.search, color: Colors.grey),
                border: OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.grey),
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
            ),
          ),
          const SizedBox(width: 8.0),
          BlocBuilder<NoteBloc, NoteState>(
            builder: (context, state) {
              return IconButton(
                icon: const Icon(Icons.print, color: Colors.grey),
                onPressed: () {
                  if (state is NotesLoaded) {
                    final notesText = state.notes
                        .map((note) {
                          return 'Note ID: ${note.id}\n'
                              'Created: ${note.createdAt}\n'
                              'Content: ${note.note}\n'
                              '-------------------\n';
                        })
                        .join('\n');

                    debugPrint('All notes:\n$notesText');
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: SingleChildScrollView(child: Text(notesText)),
                        duration: const Duration(seconds: 5),
                      ),
                    );
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('No notes available'),
                        duration: Duration(seconds: 2),
                      ),
                    );
                  }
                },
                tooltip: 'Print all notes',
              );
            },
          ),
        ],
      ),
    );
  }
}
