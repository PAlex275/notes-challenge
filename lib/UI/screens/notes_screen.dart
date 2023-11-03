import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:notes_test/UI/screens/add_note_screen.dart';
import 'package:notes_test/UI/screens/edit_note_screen.dart';
import 'package:notes_test/UI/widgets/app_bar.dart';
import 'package:notes_test/UI/widgets/banner.dart';
import 'package:notes_test/data/note_data.dart';
import 'package:notes_test/style/colors.dart';
import 'package:provider/provider.dart';

class NotesScreen extends StatelessWidget {
  const NotesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<NoteData>(
      builder: (context, value, child) => Scaffold(
        backgroundColor: CupertinoColors.systemGroupedBackground,
        appBar: const CustomAppBar(),
        body: Column(
          children: [
            const CustomBanner(),
            const SizedBox(
              height: 10,
            ),
            value.getNotes().isNotEmpty
                ? CupertinoListSection.insetGrouped(
                    children: List.generate(
                      value.getNotes().length,
                      (index) => CupertinoListTile(
                        leading: CupertinoCheckbox(
                          value: value.getNotes()[index].checked,
                          onChanged: (bool? newBool) {
                            value.updateChecked(
                                value.getNotes()[index], newBool!);
                          },
                        ),
                        title: SizedBox(
                          height: 90,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                value.getNotes()[index].text,
                                style: TextStyle(
                                  color: Colors.black,
                                  decoration:
                                      value.getNotes()[index].checked == true
                                          ? TextDecoration.lineThrough
                                          : null,
                                ),
                              ),
                            ],
                          ),
                        ),
                        trailing: ElevatedButton(
                          onPressed: () => Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => EditNoteScreen(
                                note: value.getNotes()[index],
                              ),
                            ),
                          ),
                          style: ElevatedButton.styleFrom(
                            minimumSize: const Size(70, 50),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(4.0),
                            ),
                            backgroundColor: Colors.white,
                            shadowColor: appbarColor,
                          ),
                          child: const Text(
                            'Edit',
                            style: TextStyle(
                              fontSize: 16,
                              fontFamily: 'Roboto',
                              fontWeight: FontWeight.w500,
                              color: appbarColor,
                            ),
                          ),
                        ),
                      ),
                    ),
                  )
                : const SizedBox.shrink()
          ],
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: appbarColor,
          onPressed: () => Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => const AddNoteScreen(),
            ),
          ),
          child: const Icon(Icons.add, color: Colors.white),
        ),
      ),
    );
  }
}
