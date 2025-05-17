import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:application/ui/screen/notes/model/note.dart';

class NotePreview extends StatefulWidget {
  final Note note;
  final VoidCallback? onTap;
  final bool isSelected;

  const NotePreview({
    super.key,
    required this.note,
    this.onTap,
    this.isSelected = false,
  });

  @override
  State<NotePreview> createState() => _NotePreviewState();
}

class _NotePreviewState extends State<NotePreview> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    Color? getBackgroundColor() {
      if (widget.isSelected) return Colors.blue;
      if (_isHovered) return const Color(0xFFE8E8E8);
      return null;
    }

    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: Container(
        color: getBackgroundColor(),
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
        margin: const EdgeInsets.symmetric(horizontal: 8.0),
        child: InkWell(
          onTap: widget.onTap,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                widget.note.plainText,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(fontSize: 14.0, color: Colors.black87),
              ),
              const SizedBox(height: 8.0),
              Text(
                DateFormat('MMM d, yyyy').format(widget.note.createdAt),
                style: TextStyle(fontSize: 12.0, color: Colors.grey[600]),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
