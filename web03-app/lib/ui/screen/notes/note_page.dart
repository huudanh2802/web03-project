import 'package:application/ui/screen/notes/components/note_app_bar.dart';
import 'package:application/ui/screen/notes/components/note_edit_bar.dart';
import 'package:application/ui/screen/notes/components/note_editor.dart';
import 'package:application/ui/screen/notes/components/note_list.dart';
import 'package:application/ui/screen/notes/components/note_search_bar.dart';
import 'package:flutter/material.dart';

class NotePage extends StatelessWidget {
  const NotePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: NoteAppBar(),
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
                  Expanded(flex: 1, child: NoteSearchBar()),
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
                  Expanded(flex: 1, child: NoteEditBar()),
                  const Divider(height: 1, color: Color(0xFFE0E0E0)),
                  //Note Editor
                  Expanded(flex: 6, child: NoteEditor()),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
