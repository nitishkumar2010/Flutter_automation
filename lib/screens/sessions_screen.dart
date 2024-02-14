import 'package:flutter/material.dart';
import '../data/sp_helper.dart';
import '../data/session.dart';

class SessionsScreen extends StatefulWidget {
  const SessionsScreen({super.key});

  @override
  State<SessionsScreen> createState() => _SessionsScreenState();
}

class _SessionsScreenState extends State<SessionsScreen> {
  final TextEditingController txtDescription = TextEditingController();
  final TextEditingController txtDuration = TextEditingController();
  final SPHelper helper = SPHelper();

  @override
  void initState() {
    helper.init();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text(
        'Your training sessions',
        key: ValueKey('Heading Your training sessions'),
      )),
      body: Container(),
      floatingActionButton: FloatingActionButton(
        //to add a new session to our training sessions
        onPressed: () {
          showSessionDialog(context);
        },
        key: const ValueKey('Button to add new session'),
        //to add a new session to our training sessions
        child: const Icon(
          Icons.add,
          key: ValueKey('Add Icon'),
        ),
      ),
    );
  }

  Future<dynamic> showSessionDialog(BuildContext context) async {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text(
              'Insert Training session',
              key: ValueKey('Text Insert Training session'),
            ),
            content: SingleChildScrollView(
              child: Column(
                key: const ValueKey('Column with SingleChildSCrollView'),
                children: [
                  TextField(
                    controller: txtDescription,
                    decoration: const InputDecoration(hintText: 'Description'),
                    key: const ValueKey('TextField with HintText Description'),
                  ),
                  TextField(
                    controller: txtDuration,
                    decoration: const InputDecoration(hintText: 'Duration'),
                    key: const ValueKey('TextField with HintText Duration'),
                  )
                ],
              ),
            ),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                  txtDescription.text = '';
                  txtDuration.text = '';
                },
                key: const ValueKey('TextButton'),
                child: const Text(
                  'Cancel',
                  key: ValueKey('TextButton Cancel'),
                ),
              ),
              ElevatedButton(
                  onPressed: saveSession,
                  key: const ValueKey('Elevated Button'),
                  child: const Text(
                    'Save',
                    key: ValueKey('ElevatedButton Save'),
                  )),
            ],
            key: const ValueKey('Alert Dialog'),
          );
        });
  }

  Future saveSession() async {
    DateTime now = DateTime.now();
    String today = '${now.year}-${now.month}-${now.day}';
    Session newSession = Session(
        1, today, txtDescription.text, int.tryParse(txtDuration.text) ?? 0);
    helper.writeSession(newSession);
    txtDescription.text = '';
    txtDuration.text = '';
    Navigator.pop(context);
  }
}
