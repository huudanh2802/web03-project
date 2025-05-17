import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_quill/flutter_quill.dart';
import 'package:application/ui/screen/notes/bloc/note_bloc.dart';
import 'package:application/ui/screen/notes/bloc/note_event.dart';
import 'package:application/ui/screen/notes/bloc/note_state.dart';

class NoteEditor extends StatefulWidget {
  final QuillController controller;

  const NoteEditor({super.key, required this.controller});

  @override
  State<NoteEditor> createState() => _NoteEditorState();
}

class _NoteEditorState extends State<NoteEditor> {
  bool _isInitialized = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    // Don't dispose the controller here as it's managed by the parent
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NoteBloc, NoteState>(
      listener: (context, state) {
        if (state is NotesLoaded &&
            state.selectedNote != null &&
            !_isInitialized) {
          widget.controller.document = Document.fromJson(
            json.decode('[{"insert": "${state.selectedNote!.note}\\n"}]'),
          );
          print("Check2");
          _isInitialized = true;
        } else if (state is NotesLoaded && state.selectedNote == null) {
          print("Check");
          widget.controller.document = Document();
          _isInitialized = false;
        }
      },
      builder: (context, state) {
        if (state is! NotesLoaded || state.selectedNote == null) {
          return const Center(
            child: Text(
              'Select a note or create a new one',
              style: TextStyle(color: Colors.grey),
            ),
          );
        }

        return Column(
          children: [
            Expanded(
              child: Container(
                padding: const EdgeInsets.all(16.0),
                child: QuillEditor.basic(
                  controller: widget.controller,
                  config: new QuillEditorConfig(),
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
