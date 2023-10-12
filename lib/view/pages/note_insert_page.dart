import 'package:example_for_module_app/model/note.dart';
import 'package:example_for_module_app/view/components/snack_bar.dart';
import 'package:example_for_module_app/viewmodel/note_controller.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

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
      _getCurrentDate(),
      _priority,
    );

    NoteController.to.addNote(note);

    showSnackBar(
      context,
      message: 'note is added',
    );
  }

  String _getCurrentDate() {
    final currentDate = DateTime.now();
    final formatter = DateFormat('d MMM');
    final formattedDate = formatter.format(currentDate);

    return formattedDate;
  }
}
