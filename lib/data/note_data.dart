import 'package:flutter/material.dart';
import 'package:notes_test/data/note.dart';

class NoteData extends ChangeNotifier {
  List<Note> allNotes = [];

  List<Note> getNotes() {
    return allNotes;
  }

  void addNote(String text) {
    allNotes.add(Note(id: allNotes.length + 1, text: text));
    notifyListeners();
  }

  void updateChecked(Note note, bool checked) {
    for (int i = 0; i < allNotes.length; i++) {
      if (allNotes[i].id == note.id) {
        allNotes[i].checked = checked;
      }
    }
    notifyListeners();
  }

  void updateNote(Note note, String newText) {
    for (int i = 0; i < allNotes.length; i++) {
      if (allNotes[i].id == note.id) {
        allNotes[i].text = newText;
      }
    }
    notifyListeners();
  }
}
