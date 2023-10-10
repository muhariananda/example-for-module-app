import 'package:example_for_module_app/model/note.dart';
import 'package:example_for_module_app/model/priority.dart';
import 'package:example_for_module_app/viewmodel/note_controller.dart';
import 'package:flutter/material.dart';

class NoteDetailPage extends StatefulWidget {
  const NoteDetailPage({
    required this.note,
    super.key,
  });

  static const routeName = '/note-detail';

  final Note note;

  @override
  State<NoteDetailPage> createState() => _NoteDetailPageState();
}

class _NoteDetailPageState extends State<NoteDetailPage> {
  late Note note;

  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _contentController = TextEditingController();

  @override
  void initState() {
    super.initState();
    note = widget.note;
    _titleController.text = note.title;
    _contentController.text = note.content;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            icon: const Icon(
              Icons.delete_rounded,
            ),
            onPressed: _onDeleted,
          ),
        ],
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Wrap(
                spacing: 5,
                children: Priority.values.map((priority) {
                  return ChoiceChip(
                    label: Text(priority.name),
                    selected: note.priority == priority,
                  );
                }).toList(),
              ),
              const SizedBox(height: 16),
              TextField(
                controller: _titleController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Title',
                ),
              ),
              const SizedBox(height: 16),
              TextField(
                controller: _contentController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Content',
                ),
                maxLines: 5,
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _onDeleted() {
    NoteController.to.deleteNote(note);

    const snackBar = SnackBar(
      content: Text('Note is deleted'),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
    Navigator.pop(context);
  }
}
