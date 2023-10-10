import 'package:example_for_module_app/model/note.dart';
import 'package:example_for_module_app/model/priority.dart';
import 'package:example_for_module_app/utils/date.dart';
import 'package:example_for_module_app/viewmodel/note_controller.dart';
import 'package:flutter/material.dart';

class NoteInsertPage extends StatefulWidget {
  const NoteInsertPage({super.key});

  static const routeName = '/note-insert';

  @override
  State<NoteInsertPage> createState() => _NoteInsertPageState();
}

class _NoteInsertPageState extends State<NoteInsertPage> {
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _contentController = TextEditingController();

  Priority _priority = Priority.low;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            icon: const Icon(
              Icons.save_rounded,
            ),
            onPressed: _onAdded,
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
                    selected: _priority == priority,
                    onSelected: (_) {
                      setState(() {
                        _priority = priority;
                      });
                    },
                  );
                }).toList(),
              ),
              const SizedBox(height: 16),
              TextField(
                controller: _titleController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Title',
                  hintText: 'Add title...',
                ),
              ),
              const SizedBox(height: 16),
              TextField(
                controller: _contentController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Content',
                  hintText: 'Add content...',
                ),
                maxLines: 5,
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _onAdded() {
    final note = Note(
      _titleController.text,
      _contentController.text,
      getCurrentDate(),
      _priority,
    );

    NoteController.to.addNote(note);

    const snackBar = SnackBar(
      content: Text('Note is added'),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
    Navigator.pop(context);
  }
}
