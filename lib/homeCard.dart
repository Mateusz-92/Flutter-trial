import 'package:flutter/material.dart';
import 'package:my_app/addFlashCard.dart';
import 'package:my_app/addHomeCardTmp.dart';
import 'package:my_app/addSubjectAndCard.dart';
import 'package:my_app/addSubjectForm.dart';
import 'package:my_app/flashCardList.dart';
import 'package:my_app/login.dart';
import 'package:my_app/signUpScreen.dart';
import 'package:my_app/supabase_manager.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'subjectCardList.dart';

class HomeCard extends StatefulWidget {
  const HomeCard({super.key});
  @override
  State<HomeCard> createState() => _HomeCardState();
}

class _HomeCardState extends State<HomeCard> {
  SupabaseManager supabaseManager = SupabaseManager();
  String datatable = 'card_box';
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var user = ModalRoute.of(context)!.settings.arguments.toString();
    return Scaffold(
      body: Center(
        // child: SizedBox(
        //   height: 400,
        //   width: 500,
        child: Column(
          children: [
            Expanded(
              child: FutureBuilder(
                  future: supabaseManager.getCardBoxData(datatable, user),
                  builder: (context, AsyncSnapshot snapshot) {
                    if (snapshot.data == null)
                      return (const Text('...Loading'));
                    return ListView.builder(
                        itemCount: snapshot.data!.length ?? 0,
                        itemBuilder: (context, index) {
                          var cardBoxId = snapshot.data[index]['id'];
                          var subjects = snapshot.data![index]['subject'] ?? '';
                          var subject = subjects
                              .map((e) => {'name': e['name'], 'id': e['id']})
                              .toList();

                          return Column(
                            children: <Widget>[
                              ExpansionTile(
                                  title: Text(snapshot.data[index]['name']),
                                  children: [
                                    ListTile(
                                      title: Center(
                                        child: Column(
                                          children: subject
                                              .map<Widget>((e) => Row(
                                                    children: [
                                                      TextButton(
                                                          onPressed: () {
                                                            Navigator.push(
                                                              context,
                                                              MaterialPageRoute(
                                                                builder: (_) =>
                                                                    const FlashCardList(),
                                                                settings:
                                                                    RouteSettings(
                                                                  arguments: [
                                                                    e['id'],
                                                                    e['name'],
                                                                  ],
                                                                  // arguments: {
                                                                  //   e['id']
                                                                  // },
                                                                ),
                                                              ),
                                                            );
                                                            print(e['id']);
                                                          },
                                                          child:
                                                              Text(e['name'])),
                                                    ],
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                  ))
                                              .toList(),
                                        ),
                                      ),
                                    ),
                                    IconButton(
                                      onPressed: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  AddSubjectAndCard(),
                                              settings: RouteSettings(
                                                  arguments: cardBoxId)),
                                        ).then((value) => setState(() {}));
                                      },
                                      icon: Icon(Icons.add),
                                    ),
                                  ]),
                            ],
                          );
                        });
                  }),
            ),
            IconButton(
              onPressed: () async {
                final nav = await Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (_) => const AddHomeCardTmp(),
                      settings: RouteSettings(arguments: user)),
                );
                setState(() {});
              },
              icon: const Icon(Icons.add),
            ),
            IconButton(
                onPressed: () {
                  supabaseManager.logout(context);
                },
                icon: const Icon(Icons.logout))
          ],
        ),
      ),
    );
  }
}
