import 'package:flutter/material.dart';
import 'package:my_app/homeCard.dart';
import 'package:my_app/supabase_manager.dart';

class UpdateCardBox extends StatefulWidget {
  const UpdateCardBox({super.key});

  @override
  State<UpdateCardBox> createState() => _UpdateCardBoxState();
}

class _UpdateCardBoxState extends State<UpdateCardBox> {
  SupabaseManager supabaseManager = SupabaseManager();

  final homeCard = TextEditingController();
  String dataTable = 'card_box';
  //final subject = TextEditingController();

  @override
  Widget build(BuildContext context) {
    // var user = ModalRoute.of(context)!.settings.arguments.toString();
    var cardBoxId = ModalRoute.of(context)!.settings.arguments.toString();

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
                      HomeCard();
                    });
                  });
                },
              ),
              TextFormField(
                controller: homeCard,
                decoration: const InputDecoration(
                  border: UnderlineInputBorder(),
                  labelText: 'Edit name',
                ),
              ),
              IconButton(
                iconSize: 45,
                icon: const Icon(Icons.add_circle_sharp),
                onPressed: () async {
                  if (homeCard.text == '') return;
                  supabaseManager
                      .updateCardBox(homeCard.text, cardBoxId)
                      .toString();
                  setState(() {});
                  homeCard.text = '';
                  print(' CARD BOX ID$cardBoxId');
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
