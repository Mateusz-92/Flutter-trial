import 'package:flutter/material.dart';
import 'package:my_app/supabase_manager.dart';

class UpdateFlashCard extends StatefulWidget {
  const UpdateFlashCard({super.key});

  @override
  State<UpdateFlashCard> createState() => _UpdateFlashCardState();
}

class _UpdateFlashCardState extends State<UpdateFlashCard> {
  SupabaseManager supabaseManager = SupabaseManager();

  final frontText = TextEditingController();
  final backText = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var flashCardId = ModalRoute.of(context)!.settings.arguments.toString();

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
                      UpdateFlashCard();
                    });
                  });
                },
              ),
              TextFormField(
                controller: frontText,
                decoration: const InputDecoration(
                  border: UnderlineInputBorder(),
                  labelText: 'Edit front text card',
                ),
              ),
              TextFormField(
                controller: backText,
                decoration: const InputDecoration(
                  border: UnderlineInputBorder(),
                  labelText: 'Edit back text card',
                ),
              ),
              IconButton(
                iconSize: 45,
                icon: const Icon(Icons.add_circle_sharp),
                onPressed: () async {
                  if (frontText.text == '' || backText.text == '') return;
                  supabaseManager.updataFlashCard(
                      frontText.text, backText.text, flashCardId);
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
