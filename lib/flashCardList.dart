import 'package:flutter/material.dart';
import 'package:my_app/supabase_manager.dart';
import 'addFlashCard.dart';

class FlashCardList extends StatefulWidget {
  const FlashCardList({super.key});

  @override
  State<FlashCardList> createState() => _FlashCardListState();
}

class _FlashCardListState extends State<FlashCardList> {
  SupabaseManager supabaseManager = SupabaseManager();
  String datatable = 'card';
  String subjectId = 'subject_id';

  @override
  Widget build(BuildContext context) {
    final id = ModalRoute.of(context)!.settings.arguments.toString();

    return Scaffold(
      body: SafeArea(
        child: Center(
          child: SizedBox(
            height: 600,
            width: 500,
            child: Column(
              children: [
                Expanded(
                  child: FutureBuilder(
                      future: supabaseManager.getData(datatable, subjectId, id),
                      builder: (context, AsyncSnapshot snapshot) {
                        if (snapshot.data == null) {
                          return (const Text('...Loading'));
                        }
                        return ListView.builder(
                            itemCount: snapshot.data.length ?? 0,
                            itemBuilder: (context, index) {
                              return Column(
                                children: <Widget>[
                                  Card(
                                    color: Colors.blue[400],
                                    child: ListTile(
                                      leading: IconButton(
                                        onPressed: () async {
                                          await supabaseManager.deleteData(
                                              datatable,
                                              snapshot.data[index]['id']);
                                          setState(() {});
                                        },
                                        icon: const Icon(Icons.delete_forever),
                                      ),
                                      subtitle: Center(
                                        child: Text(
                                            snapshot.data[index]['front_text']),
                                      ),
                                      title: Center(
                                        child: Text(
                                            snapshot.data[index]['back_text']),
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
                          builder: (_) => const FlashCard(),
                          settings: RouteSettings(
                            arguments: id,
                          ),
                        ),
                      );
                      setState(() {});
                    },
                    icon: Icon(Icons.add))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
