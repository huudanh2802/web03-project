import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:application/ui/screen/notes/bloc/note_bloc.dart';
import 'package:application/ui/screen/notes/bloc/note_event.dart';
import 'package:application/ui/screen/notes/components/note_app_bar.dart';
import 'package:application/ui/screen/notes/components/note_edit_bar.dart';
import 'package:application/ui/screen/notes/components/note_editor.dart';
import 'package:application/ui/screen/notes/components/note_list.dart';
import 'package:application/ui/screen/notes/components/note_search_bar.dart';
import 'package:flutter_quill/flutter_quill.dart';

class NotePage extends StatelessWidget {
  const NotePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NoteBloc(),
      child: const NotePageBody(),
    );
  }
}

class NotePageBody extends StatefulWidget {
  const NotePageBody({super.key});

  @override
  State<NotePageBody> createState() => _NotePageBody();
}

class _NotePageBody extends State<NotePageBody> {
  late NoteBloc _noteBloc;
  late QuillController _quillController;

  @override
  void initState() {
    super.initState();
    _noteBloc = BlocProvider.of(context);
    _quillController = QuillController.basic();
    _quillController.document.changes.listen((event) {
      print(event); //Delta
    });
    _noteBloc.add(LoadNotes());
  }

  @override
  void dispose() {
    _quillController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const NoteAppBar(),
      body: Row(
        children: <Widget>[
          Expanded(
            flex: 1,
            child: Container(
              //background color lighter shades of grey
              color: Colors.grey[300],
              child: Column(
                children: [
                  //Search bar
                  Expanded(
                    flex: 1,
                    child: NoteSearchBar(controller: _quillController),
                  ),
                  //Note List
                  Expanded(flex: 6, child: NoteList()),
                ],
              ),
            ),
          ),
          const VerticalDivider(color: Color(0xFFE0E0E0), width: 1),
          Expanded(
            flex: 4,
            child: Container(
              child: Column(
                children: [
                  //Note edtit bar
                  Expanded(
                    flex: 1,
                    child: NoteEditBar(controller: _quillController),
                  ),
                  const Divider(height: 1, color: Color(0xFFE0E0E0)),
                  //Note Editor
                  Expanded(
                    flex: 6,
                    child: NoteEditor(controller: _quillController),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
