import 'package:example_for_module_app/model/note.dart';
import 'package:example_for_module_app/view/components/note_item.dart';
import 'package:flutter/material.dart';

class NoteListView extends StatelessWidget {
  const NoteListView({
    required this.noteList,
    super.key,
  });

  final List<Note> noteList;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: noteList.length,
      separatorBuilder: (context, index) {
        return const SizedBox(height: 8);
      },
      itemBuilder: (context, index) {
        final note = noteList[index];
        return NoteItem(note: note);
      },
    );
  }
}
