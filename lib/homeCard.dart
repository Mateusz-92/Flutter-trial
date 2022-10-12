import 'package:flutter/material.dart';
import 'package:my_app/addHomeCardTmp.dart';
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
  Widget build(BuildContext context) {
    var user = ModalRoute.of(context)!.settings.arguments.toString();
    return Scaffold(
      body: Center(
        child: SizedBox(
          height: 400,
          width: 500,
          child: Column(
            children: [
              Expanded(
                child: FutureBuilder(
                    // future: supabaseManager.getCardBoxData(datatable),
                    future: supabaseManager.getCardBoxData(datatable),
                    builder: (context, AsyncSnapshot snapshot) {
                      if (snapshot.data == null)
                        return (const Text('...Loading'));
                      return ListView.builder(
                          itemCount: snapshot.data.length ?? 0,
                          itemBuilder: (context, index) {
                            return Column(
                              children: <Widget>[
                                Card(
                                  color: Colors.blue[400],
                                  child: ListTile(
                                    onTap: () {
                                      var id = snapshot.data[index]['id'];

                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (_) => const Subject(),
                                          settings: RouteSettings(
                                            arguments: {
                                              id,
                                            },
                                          ),
                                        ),
                                      );
                                    },
                                    leading: IconButton(
                                      onPressed: () async {
                                        await supabaseManager.deleteData(
                                            datatable,
                                            snapshot.data[index]['id']);
                                        setState(() {});
                                      },
                                      icon: const Icon(Icons.delete_forever),
                                    ),
                                    title: Center(
                                      child: Text(snapshot.data[index]['name']),
                                    ),
                                  ),
                                ),
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
      ),
    );
  }
}
