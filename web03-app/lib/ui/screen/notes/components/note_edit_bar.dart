import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:application/ui/screen/notes/bloc/note_bloc.dart';
import 'package:application/ui/screen/notes/bloc/note_event.dart';
import 'package:application/ui/screen/notes/bloc/note_state.dart';

class NoteEditBar extends StatelessWidget {
  const NoteEditBar({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NoteBloc, NoteState>(
      builder: (context, state) {
        return Container(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                decoration: BoxDecoration(
                  color: Colors.amber[300]?.withAlpha(51),
                  shape: BoxShape.circle,
                ),
                child: IconButton(
                  icon: Icon(Icons.add, color: Colors.amber[700]),
                  onPressed: () {
                    context.read<NoteBloc>().add(const AddNote());
                  },
                  tooltip: 'Add new note',
                ),
              ),
              Row(
                children: [
                  IconButton(
                    icon: const Icon(Icons.format_bold, color: Colors.black),
                    onPressed: () {
                      // TODO: Implement bold formatting
                    },
                    tooltip: 'Bold',
                  ),
                  IconButton(
                    icon: const Icon(Icons.format_italic, color: Colors.black),
                    onPressed: () {
                      // TODO: Implement italic formatting
                    },
                    tooltip: 'Italic',
                  ),
                  IconButton(
                    icon: const Icon(
                      Icons.format_underline,
                      color: Colors.black,
                    ),
                    onPressed: () {
                      // TODO: Implement underline formatting
                    },
                    tooltip: 'Underline',
                  ),
                ],
              ),
              Container(
                decoration: BoxDecoration(
                  color: Colors.red.withAlpha(51),
                  shape: BoxShape.circle,
                ),
                child: IconButton(
                  icon: const Icon(Icons.delete, color: Colors.red),
                  onPressed:
                      state is NotesLoaded &&
                              state.selectedNote != null &&
                              state.selectedNote!.id != null
                          ? () {
                            context.read<NoteBloc>().add(
                              DeleteNote(state.selectedNote!.id!),
                            );
                          }
                          : null,
                  tooltip: 'Delete note',
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
