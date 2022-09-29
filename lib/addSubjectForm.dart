import 'package:flutter/material.dart';
import 'package:my_app/subjectCardList.dart';
import 'package:my_app/supabase_manager.dart';

class AddSubjectForm extends StatefulWidget {
  const AddSubjectForm({super.key});

  @override
  State<AddSubjectForm> createState() => _AddSubjectFormState();
}

class _AddSubjectFormState extends State<AddSubjectForm> {
  SupabaseManager supabaseManager = SupabaseManager();

  final subject = TextEditingController();
  String dataTable = 'subject';
  String parentName = 'card_box_id';

  @override
  Widget build(BuildContext context) {
    var parentId = ModalRoute.of(context)!.settings.arguments.toString();

    return Scaffold(
      backgroundColor: Color.fromARGB(255, 168, 199, 224),
      body: Center(
        child: SizedBox(
          width: 300,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              BackButton(
                color: Colors.black,
                onPressed: () {
                  Navigator.pop(context, () {
                    setState(() {
                      Subject();
                    });
                  });
                },
              ),
              TextFormField(
                controller: subject,
                decoration: const InputDecoration(
                  border: UnderlineInputBorder(),
                  labelText: 'Write text',
                ),
              ),
              IconButton(
                iconSize: 45,
                icon: const Icon(Icons.add_circle_sharp),
                onPressed: () async {
                  supabaseManager.addSubjectData(
                      dataTable, subject.text, parentName, parentId);
                  setState(() {});
                  subject.text = '';
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
