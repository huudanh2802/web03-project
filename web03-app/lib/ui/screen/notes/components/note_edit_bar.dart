import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_quill/flutter_quill.dart';
import 'package:application/ui/screen/notes/bloc/note_bloc.dart';
import 'package:application/ui/screen/notes/bloc/note_event.dart';
import 'package:application/ui/screen/notes/bloc/note_state.dart';

class NoteEditBar extends StatelessWidget {
  final QuillController controller;

  const NoteEditBar({super.key, required this.controller});

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
              Expanded(
                child: QuillSimpleToolbar(
                  controller: controller,
                  config: const QuillSimpleToolbarConfig(),
                ),
              ),
              if (state is NotesLoaded &&
                  state.selectedNote != null &&
                  state.selectedNote!.id != null)
                Container(
                  decoration: BoxDecoration(
                    color: Colors.red.withAlpha(51),
                    shape: BoxShape.circle,
                  ),
                  child: IconButton(
                    icon: const Icon(Icons.delete, color: Colors.red),
                    onPressed: () {
                      context.read<NoteBloc>().add(
                        DeleteNote(state.selectedNote!.id!),
                      );
                    },
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
