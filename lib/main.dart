import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:path_provider/path_provider.dart';
import 'package:provider/provider.dart';
import 'package:todo/HomePage/HomeScreen.dart';
import 'package:todo/SplashScreen/SplashScreen.dart';
import 'package:todo/provider/note_changeNotifier.dart';
import 'package:todo/watchboxtest.dart';
import 'package:todo/Model/model.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final dir = await getApplicationDocumentsDirectory();

  Hive.init(dir.path);
  Hive.registerAdapter(NoteModelAdapter());
  await Hive.openBox("todo");

  var box1 = Hive.box("todo");

  runApp(
    ChangeNotifierProvider(
      create: (_) => Note_Change_Notifier(),
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        debugShowCheckedModeBanner: false,
        home: Splashscreen());
  }
}
