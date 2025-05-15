import 'package:flutter/material.dart';

class NoteEditor extends StatefulWidget {
  const NoteEditor({super.key});

  @override
  State<NoteEditor> createState() => _NoteEditorState();
}

class _NoteEditorState extends State<NoteEditor> {
  final TextEditingController _controller = TextEditingController();
  TextStyle _currentStyle = const TextStyle(
    fontSize: 16.0,
    color: Colors.black,
  );

  void _applyStyle(TextStyle style) {
    setState(() {
      _currentStyle = style;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Text editor
        Expanded(
          child: Container(
            padding: const EdgeInsets.all(28.0),
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(8.0)),
            child: TextField(
              controller: _controller,
              maxLines: null,
              expands: true,
              style: _currentStyle,
              decoration: const InputDecoration(
                hintText: 'Start typing your note here...',
                border: InputBorder.none,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
