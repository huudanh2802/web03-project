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
        // Toolbar for formatting options
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              IconButton(
                icon: const Icon(Icons.format_bold),
                onPressed:
                    () => _applyStyle(
                      _currentStyle.copyWith(fontWeight: FontWeight.bold),
                    ),
              ),
              IconButton(
                icon: const Icon(Icons.format_italic),
                onPressed:
                    () => _applyStyle(
                      _currentStyle.copyWith(fontStyle: FontStyle.italic),
                    ),
              ),
              IconButton(
                icon: const Icon(Icons.format_underline),
                onPressed:
                    () => _applyStyle(
                      _currentStyle.copyWith(
                        decoration: TextDecoration.underline,
                      ),
                    ),
              ),
              IconButton(
                icon: const Icon(Icons.color_lens),
                onPressed:
                    () =>
                        _applyStyle(_currentStyle.copyWith(color: Colors.blue)),
              ),
            ],
          ),
        ),
        // Text editor
        Expanded(
          child: Container(
            padding: const EdgeInsets.all(16.0),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey),
              borderRadius: BorderRadius.circular(8.0),
            ),
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
