import 'package:flutter/material.dart';
import 'package:notes_test/data/note.dart';
import 'package:notes_test/data/note_data.dart';
import 'package:notes_test/style/colors.dart';
import 'package:provider/provider.dart';

class EditNoteScreen extends StatefulWidget {
  const EditNoteScreen({
    super.key,
    required this.note,
  });
  final Note note;

  @override
  State<EditNoteScreen> createState() => _EditNoteScreenState();
}

class _EditNoteScreenState extends State<EditNoteScreen> {
  final TextEditingController controller = TextEditingController();
  @override
  void initState() {
    controller.text = widget.note.text;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: appbarColor,
        title: const Text(
          'Edit Task',
          style: TextStyle(
              fontSize: 24, fontWeight: FontWeight.w500, color: Colors.white),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 50,
          ),
          const Padding(
            padding: EdgeInsets.only(left: 20, bottom: 10),
            child: Text(
              'Task Name',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              left: 20,
              right: 20,
            ),
            child: TextFormField(
              controller: controller,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                filled: true,
                hintStyle: TextStyle(color: Colors.grey[800]),
                hintText: "Type in your text",
                fillColor: Colors.white70,
              ),
            ),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: appbarColor,
        onPressed: () {
          Provider.of<NoteData>(context, listen: false)
              .updateNote(widget.note, controller.text);
          Navigator.pop(context);
        },
        label: SizedBox(
          width: MediaQuery.of(context).size.width - 100,
          child: const Center(
            child: Text(
              'Done',
              style: TextStyle(color: Colors.white),
            ),
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
