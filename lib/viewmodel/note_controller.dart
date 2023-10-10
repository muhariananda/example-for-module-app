import 'package:example_for_module_app/model/note.dart';
import 'package:get/get.dart';

class NoteController extends GetxController {
  static NoteController get to => Get.find();

  final notes = <Note>[];

  void addNote(Note note) {
    notes.add(note);
    update();
  }

  void deleteNote(Note note) {
    notes.remove(note);
    update();
  }
}
