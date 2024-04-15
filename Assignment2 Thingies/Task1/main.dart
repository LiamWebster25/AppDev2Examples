import 'dart:async';
import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

Future<Database>? database;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  database = openDatabase(
    join(await getDatabasesPath(), 'person_database.db'),
    onCreate: (db, version) {
      return db.execute(
        'CREATE TABLE person(id INTEGER PRIMARY KEY AUTOINCREMENT, first_name TEXT, last_name TEXT)',
      );
    },
    version: 1,
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'CRUD SQLite',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();

  Future<List<Person>>? _personList;
  Person? _currentPerson;

  @override
  void initState() {
    super.initState();
    _refreshPersonList();
  }

  _refreshPersonList() {
    setState(() {
      _personList = persons();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('CRUD SQLite'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: _firstNameController,
              decoration: InputDecoration(
                labelText: 'First name',
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: _lastNameController,
              decoration: InputDecoration(
                labelText: 'Last name',
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton(
                    child: Text('ADD'),
                    onPressed: () {
                      if (_firstNameController.text.isNotEmpty &&
                          _lastNameController.text.isNotEmpty) {
                        insertPerson(Person(
                            first_name: _firstNameController.text,
                            last_name: _lastNameController.text))
                            .then((_) {
                          _refreshPersonList();
                          _firstNameController.clear();
                          _lastNameController.clear();
                        });
                      }
                    },
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton(
                    child: Text('UPDATE'),
                    onPressed: () {
                      if (_currentPerson != null &&
                          _firstNameController.text.isNotEmpty &&
                          _lastNameController.text.isNotEmpty) {
                        updatePerson(Person(
                            id: _currentPerson!.id,
                            first_name: _firstNameController.text,
                            last_name: _lastNameController.text))
                            .then((_) {
                          _refreshPersonList();
                          _firstNameController.clear();
                          _lastNameController.clear();
                          _currentPerson = null;
                        });
                      }
                    },
                  ),
                ),
              ),
            ],
          ),
          Container(
            margin: const EdgeInsets.only(left: 10.0, right: 10.0),
            child: Divider(
              color: Colors.deepPurple,
              height: 0,
            ),
          ),
          Expanded(
            child: FutureBuilder(
              future: _personList,
              builder: (context, AsyncSnapshot<List<Person>> snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(child: CircularProgressIndicator());
                } else if (snapshot.hasError) {
                  return Center(child: Text('Error: ${snapshot.error}'));
                } else {
                  final persons = snapshot.data ?? [];
                  return ListView.builder(
                    itemCount: persons.length,
                    itemBuilder: (context, index) {
                      final person = persons[index];
                      return ListTile(
                        title: Text("${person.first_name} ${person.last_name}"),
                        trailing: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            IconButton(
                              icon: Icon(Icons.edit),
                              // Add this inside the IconButton for edit in your ListTile
                              onPressed: () {
                                setState(() {
                                  _currentPerson = person;
                                  _firstNameController.text = person.first_name;
                                  _lastNameController.text = person.last_name;
                                });
                              },
                            ),
                            IconButton(
                              icon: Icon(Icons.delete),
                              onPressed: () {
                                deletePerson(person.id).then((_) {
                                  _refreshPersonList();
                                });
                              },
                            ),
                          ],
                        ),
                      );
                    },
                  );
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}

class Person {
  final int id;
  final String first_name;
  final String last_name;

  Person({
    this.id = 0,
    required this.first_name,
    required this.last_name,
  });

  Map<String, dynamic> toMap() {
    return {
      'first_name': first_name,
      'last_name': last_name,
    };
  }

  @override
  String toString() {
    return 'Person{id: $id, first_name: $first_name, last_name: $last_name}';
  }
}

Future<void> insertPerson(Person person) async {
  final db = await database;
  await db?.insert(
    'person',
    person.toMap(),
    conflictAlgorithm: ConflictAlgorithm.replace,
  );
  // After inserting the person, refresh the list to update UI
}

Future<List<Person>> persons() async {
  final db = await database;
  final List<Map<String, dynamic>> maps = await db!.query('person');

  return List.generate(maps.length, (i) {
    return Person(
      id: maps[i]['id'] as int,
      first_name: maps[i]['first_name'] as String,
      last_name: maps[i]['last_name'] as String,
    );
  });
}

Future<void> updatePerson(Person person) async {
  final db = await database;
  await db?.update(
    'person',
    person.toMap(),
    where: 'id = ?',
    whereArgs: [person.id],
  );
  // After updating the person, refresh the list to update UI
}

Future<void> deletePerson(int id) async {
  final db = await database;
  await db?.delete(
    'person',
    where: 'id = ?',
    whereArgs: [id],
  );
  // After deleting the person, refresh the list to update UI
}
