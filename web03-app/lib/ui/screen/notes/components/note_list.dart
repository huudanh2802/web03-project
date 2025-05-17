import 'package:application/ui/screen/notes/bloc/note_bloc.dart';
import 'package:application/ui/screen/notes/bloc/note_event.dart';
import 'package:application/ui/screen/notes/bloc/note_state.dart';
import 'package:application/ui/screen/notes/components/note_preview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NoteList extends StatelessWidget {
  const NoteList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NoteBloc, NoteState>(
      listener: (context, state) {
        // Handle any side effects here if needed
      },
      builder: (context, state) {
        if (state is NotesLoaded) {
          return ListView.builder(
            itemCount: state.notes.length,
            itemBuilder: (context, index) {
              final note = state.notes[index];
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 4.0),
                child: NotePreview(
                  note: note,
                  isSelected: note.id == state.selectedNote?.id,
                  onTap: () {
                    context.read<NoteBloc>().add(SelectNote(note));
                  },
                ),
              );
            },
          );
        }
        return const Center(child: CircularProgressIndicator());
      },
    );
  }
}
