import 'package:flutter/material.dart';
import 'package:my_app/supabase_manager.dart';

class FlashCard extends StatefulWidget {
  const FlashCard({super.key});

  @override
  State<FlashCard> createState() => _FlashCardState();
}

class _FlashCardState extends State<FlashCard> {
  SupabaseManager supabaseManager = SupabaseManager();

  final frontText = TextEditingController();
  final backText = TextEditingController();
  var parentName = 'subject_id';

  @override
  Widget build(BuildContext context) {
    final parentId = ModalRoute.of(context)!.settings.arguments.toString();

    return Scaffold(
      backgroundColor: Colors.blue[200],
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
                      FlashCard();
                    });
                  });
                },
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
                  if (frontText.text == '' || backText.text == '') return;
                  supabaseManager
                      .addFlashCardData(
                          frontText.text, backText.text, parentName, parentId)
                      .toString();
                  setState(() {});
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
