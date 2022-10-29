import 'package:flutter/material.dart';
import 'package:my_app/homeCard.dart';
import 'package:my_app/subjectCardList.dart';
import 'package:my_app/supabase_manager.dart';

class UpdateSubject extends StatefulWidget {
  const UpdateSubject({super.key});

  @override
  State<UpdateSubject> createState() => _UpdateSubjectState();
}

class _UpdateSubjectState extends State<UpdateSubject> {
  SupabaseManager supabaseManager = SupabaseManager();

  final subject = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var subjectId = ModalRoute.of(context)!.settings.arguments.toString();

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
                  Navigator.pop(context,
                      MaterialPageRoute(builder: (context) => HomeCard()));
                },
              ),
              TextFormField(
                controller: subject,
                decoration: const InputDecoration(
                  border: UnderlineInputBorder(),
                  labelText: 'Edit subject name ',
                ),
              ),
              IconButton(
                iconSize: 45,
                icon: const Icon(Icons.add_circle_sharp),
                onPressed: () async {
                  if (subject.text == '') return;
                  supabaseManager
                      .updateSubject(subject.text, subjectId)
                      .toString();
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
