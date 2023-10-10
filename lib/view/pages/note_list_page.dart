import 'package:example_for_module_app/view/components/empty_notes_alert.dart';
import 'package:example_for_module_app/view/components/note_list_view.dart';
import 'package:example_for_module_app/view/pages/note_insert_page.dart';
import 'package:example_for_module_app/viewmodel/note_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NoteListPage extends StatelessWidget {
  const NoteListPage({super.key});

  static const routeName = '/';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Note'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8),
          // * Call the Getbuilder to observe the data
          child: GetBuilder<NoteController>(
            init: NoteController(),
            builder: (controller) {
              return controller.notes.isEmpty
                  ? const EmptyNotesAlert()
                  : NoteListView(noteList: controller.notes);
            },
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add_rounded),
        onPressed: () {
          Navigator.pushNamed(
            context,
            NoteInsertPage.routeName,
          );
        },
      ),
    );
  }
}
