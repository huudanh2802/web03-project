import 'package:flutter/material.dart';
import 'package:flutter_quill/flutter_quill.dart';

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
          IconButton(
            icon: const Icon(Icons.print, color: Colors.grey),
            onPressed: () {
              final text = controller.document.toPlainText();
              debugPrint('Current editor text: $text');
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text('Current text: $text'),
                  duration: const Duration(seconds: 3),
                ),
              );
            },
            tooltip: 'Print current text',
          ),
        ],
      ),
    );
  }
}
