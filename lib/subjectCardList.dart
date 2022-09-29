import 'package:flutter/material.dart';
import 'package:my_app/addSubjectForm.dart';
import 'package:my_app/flashCardList.dart';
import 'package:my_app/supabase_manager.dart';

class Subject extends StatefulWidget {
  const Subject({
    super.key,
  });

  @override
  State<Subject> createState() => _SubjectState();
}

class _SubjectState extends State<Subject> {
  SupabaseManager supabaseManager = SupabaseManager();
  String datatable = 'subject';
  String cardBoxId = 'card_box_id';
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
                      future: supabaseManager.getData(datatable, cardBoxId, id),
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
                                      onTap: () {
                                        var id = snapshot.data[index]['id'];
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (_) =>
                                                const FlashCardList(),
                                            settings: RouteSettings(
                                              arguments: id,
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
                                        child:
                                            Text(snapshot.data[index]['name']),
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
                          builder: (_) => const AddSubjectForm(),
                          settings: RouteSettings(arguments: id),
                        ),
                      );
                      setState(() {});
                    },
                    icon: const Icon(Icons.add))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
