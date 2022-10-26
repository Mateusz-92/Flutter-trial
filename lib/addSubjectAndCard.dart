import 'package:flutter/material.dart';
import 'package:my_app/homeCard.dart';
import 'package:my_app/subjectCardList.dart';
import 'package:my_app/supabase_manager.dart';
import 'package:uuid/uuid.dart';

class AddSubjectAndCard extends StatefulWidget {
  const AddSubjectAndCard({super.key});

  @override
  State<AddSubjectAndCard> createState() => _AddSubjectAndCardState();
}

class _AddSubjectAndCardState extends State<AddSubjectAndCard> {
  SupabaseManager supabaseManager = SupabaseManager();

  final subjectName = TextEditingController();
  final frontText = TextEditingController();
  final backText = TextEditingController();
  var subject = 'subject_id';
  String dataTable = 'subject';
  String parentName = 'card_box_id';
  @override
  Widget build(BuildContext context) {
    final parentId = ModalRoute.of(context)!.settings.arguments.toString();
    var uuid = const Uuid();
    var subId = uuid.v4();

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
                      HomeCard();
                    });
                  });
                },
              ),
              TextFormField(
                controller: subjectName,
                decoration: const InputDecoration(
                  border: UnderlineInputBorder(),
                  labelText: 'SubjectName',
                ),
              ),
              TextFormField(
                controller: frontText,
                decoration: const InputDecoration(
                  border: UnderlineInputBorder(),
                  labelText: 'Write front text card',
                ),
              ),
              TextFormField(
                controller: backText,
                decoration: const InputDecoration(
                  border: UnderlineInputBorder(),
                  labelText: 'Write back text card',
                ),
              ),
              IconButton(
                iconSize: 45,
                icon: const Icon(Icons.add_circle_sharp),
                onPressed: () async {
                  if (subjectName.text == '') return;
                  supabaseManager
                      .addSubjectData2(dataTable, subjectName.text, parentName,
                          parentId, subId)
                      .toString();
                  print('to jest id $parentId');
                  supabaseManager
                      .addFlashCardData(
                          frontText.text, backText.text, subject, subId)
                      .toString();
                  setState(() {});
                  subjectName.text = '';
                  frontText.text = '';
                  backText.text = '';
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
