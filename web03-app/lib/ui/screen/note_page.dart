import 'package:application/ui/component/note_edit_bar.dart';
import 'package:application/ui/component/note_editor.dart';
import 'package:application/ui/component/note_list.dart';
import 'package:flutter/material.dart';

class NotePage extends StatelessWidget {
  const NotePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("NotePage")),
      body: Row(
        children: <Widget>[
          Expanded(
            flex: 1,
            child: Column(
              children: [
                //Search bar
                Expanded(flex: 1, child: SearchBar()),
                const Divider(height: 1, color: Colors.grey),
                //Note List
                Expanded(flex: 3, child: NoteList()),
              ],
            ),
          ),
          const Divider(height: 10, color: Colors.grey),

          Expanded(
            flex: 2,
            child: Container(
              child: Column(
                children: [
                  //Note edtit bar
                  Expanded(flex: 1, child: NoteEditBar()),
                  const Divider(height: 1, color: Colors.grey),
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
