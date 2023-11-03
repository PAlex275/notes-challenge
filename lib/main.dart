import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:notes_test/UI/screens/notes_screen.dart';
import 'package:notes_test/data/note_data.dart';
import 'package:provider/provider.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => NoteData(),
      builder: (context, child) => MaterialApp(
        title: 'Notes App',
        theme: ThemeData(
          useMaterial3: true,
        ),
        home: const NotesScreen(),
      ),
    );
  }
}
