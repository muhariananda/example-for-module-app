import 'package:example_for_module_app/model/note.dart';
import 'package:example_for_module_app/view/pages/note_detail_page.dart';
import 'package:example_for_module_app/view/pages/note_insert_page.dart';
import 'package:example_for_module_app/view/pages/note_list_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.yellowAccent,
        ),
        useMaterial3: true,
      ),
      initialRoute: NoteListPage.routeName,
      routes: {
        NoteListPage.routeName: (_) => const NoteListPage(),
        NoteInsertPage.routeName: (_) => const NoteInsertPage(),
        NoteDetailPage.routeName: (context) {
          final args = ModalRoute.of(context)!.settings.arguments;
          return NoteDetailPage(note: args! as Note);
        }
      },
    );
  }
}
