class Note {
  Note({
    required this.id,
    required this.text,
    this.checked = false,
  });
  int id;
  String text;
  bool checked;
}
