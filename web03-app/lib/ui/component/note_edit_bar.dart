import 'package:flutter/material.dart';

class NoteEditBar extends StatelessWidget {
  const NoteEditBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: Row(
        //add an underline
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            decoration: BoxDecoration(
              color: Colors.amber[300]?.withAlpha(51),
              shape: BoxShape.circle,
            ),
            child: IconButton(
              // add a circle around icon
              icon: Icon(Icons.add, color: Colors.amber[700]),
              onPressed: () {
                // TODO: Implement new note creation
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
                icon: const Icon(Icons.format_underline, color: Colors.black),
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
              onPressed: () {
                // TODO: Implement note deletion
              },
            ),
          ),
        ],
      ),
    );
  }
}
