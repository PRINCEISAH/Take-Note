import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:path_provider/path_provider.dart';
import 'package:provider/provider.dart';
import 'package:todo/HomePage/HomeScreen.dart';
import 'package:todo/provider/note_changeNotifier.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final dir = await getApplicationDocumentsDirectory();
  Hive.init(dir.path);

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
        home: HomeScreen());
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var phonenumber;
  TextEditingController controllerkey = TextEditingController();
  TextEditingController controllervalue = TextEditingController();

  Future<String> getphonenumber() async {
    final storePath = await getApplicationDocumentsDirectory();

    await Hive.initFlutter(storePath.path);
    var phone = await Hive.openBox('phone');
    phone.put("isah", "07031568938");

    setState(() {
      phonenumber = phone.get('isah');
    });
  }

  void addnumber(String key, String value) async {
    var add = await Hive.openBox('phone');
    add.put(key, value);
    print(add.values);
  }

  void delete(String index) async {
    var delete = await Hive.openBox('phone');

    int indexvalue = int.parse(index);
    delete.deleteAt(indexvalue);
    print(delete.keys);
  }

  void edit(dynamic key, dynamic value) async {
    var edit = await Hive.openBox('phone');
    edit.put(key, value);
  }

  void checkData() async {
    var phonebox = await Hive.openBox("phone");
    print("${phonebox.keys}");
  }

  void clearall() async {
    var box = await Hive.openBox("phone");
    box.clear();
  }

  @override
  void initState() {
    getphonenumber();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextField(
            decoration: InputDecoration(),
            keyboardType: TextInputType.number,
            controller: controllerkey,
          ),
          TextField(
            decoration: InputDecoration(),
            keyboardType: TextInputType.number,
            controller: controllervalue,
          ),
          Text('$phonenumber'),
          RaisedButton(
            onPressed: () {
              delete(controllerkey.text);
              controllerkey.clear();
            },
            child: Text('delete'),
          ),
          RaisedButton(
            onPressed: () {
              addnumber(controllerkey.text, controllervalue.text);
              controllerkey.clear();
              controllervalue.clear();
            },
            child: Text('add'),
          ),
          RaisedButton(
            onPressed: () {
              edit("isah", controllerkey.text);
              controllerkey.clear();
              controllervalue.clear();
            },
            child: Text("edit"),
          ),
          RaisedButton(
            onPressed: () {
              checkData();
              controllervalue.clear();
              controllerkey.clear();
            },
            child: Text('checkdata'),
          ),
          RaisedButton(
            onPressed: () {
              clearall();
              controllerkey.clear();
            },
            child: Text('clear'),
          ),
          Column(
            children: [
              ValueListenableBuilder(
                valueListenable: Hive.box("phone").listenable(),
                builder: (context, box, widget) {
                  return Column(
                    children: [Text("${box.get('md')}")],
                  );
                },
              )
            ],
          )
        ],
      )),
    );
  }
}
