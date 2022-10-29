import 'package:flutter/cupertino.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:my_app/updateCardBox.dart';
import 'package:my_app/updateFlashCard.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:uuid/uuid.dart';
import 'package:flutter/material.dart';

var supabaseUrl = dotenv.env["API_MYURL"] ?? "Api not faund";
var supabaseKey = dotenv.env["API_MYKEY"] ?? '';

var client = SupabaseClient(supabaseUrl, supabaseKey);

class SupabaseManager {
  var uuid = const Uuid();

  // getCardBoxData(String datatable, var user) async {
  //   var response = await client
  //       .from(datatable)
  //       .select('name')
  //       .eq('user_id', user)
  //       .execute();

  //   if (response.error == null) {
  //     print('response.data: ${response.data}');
  //   }
  //   var dataList = response.data as List;
  //   return dataList;
  // }
  getCardBoxData(String datatable, var user) async {
    var response = await client
        .from('card_box')
        .select('*,subject(name,id)')
        .eq('user_id', user)
        .execute();

    if (response.error == null) {
      print('response.data: ${response.data}');
    }
    var dataList = response.data as List;
    return dataList;
  }

  getData(String datatable, String nameId, var id) async {
    var response =
        await client.from(datatable).select().eq(nameId, id).execute();
    if (response.error == null) {
      print('response.data: ${response.data}');
    }
    var dataList = response.data as List;
    return dataList;
  }

  addFlashCardData(
      var frontText, var backText, var parentName, var parentId) async {
    await client.from('card').insert([
      {
        'front_text': frontText,
        'back_text': backText,
        'id': uuid.v4(),
        parentName: parentId,
      }
    ]).execute();
  }

  addHomeCardData(String datatableName, var textForm, var userId) async {
    await client.from(datatableName).insert([
      {'name': textForm, 'id': uuid.v4(), 'user_id': userId}
    ]).execute();
  }

  addSubjectData2(String datatableName, var textForm, var parentName,
      var parentId, var id) async {
    await client.from(datatableName).insert([
      {
        'name': textForm,
        'id': id,
        parentName: parentId,
      }
    ]).execute();
  }

  addSubjectData(
      String datatableName, var textForm, var parentName, var parentId) async {
    await client.from(datatableName).insert([
      {
        'name': textForm,
        'id': uuid.v4(),
        parentName: parentId,
      }
    ]).execute();
  }

  deleteData(String datatable, var id) async {
    var respons = await client.from(datatable).delete().eq('id', id).execute();
  }

  updataFlashCard(var fronText, var backText, var id) async {
    await client
        .from('card')
        .update({'front_text': fronText, 'back_text': backText})
        .eq('id', id)
        .execute();
  }

  updateSubject(var subjectName, var id) async {
    await client
        .from('subject')
        .update({'name': subjectName})
        .eq('id', id)
        .execute();
  }

  updateCardBox(var cardBoxName, var id) async {
    await client
        .from('card_box')
        .update({
          'name': cardBoxName,
        })
        .eq('id', id)
        .execute();
  }

  Future<void> signup(context, String email, String password) async {
    //debugPrint("emial $email password $password");
    final result = await client.auth.signUp(email, password);
    if (result.data != null) {
      Navigator.pushReplacementNamed(context, '/login');
    }
  }

  Future<void> signInUser(
    BuildContext context,
    String email,
    String password,
  ) async {
    final result = await client.auth.signIn(email: email, password: password);

    if (result.data != null) {
      final userId = client.auth.user()?.id;

      Navigator.pushReplacementNamed(
        context,
        '/home_card',
        arguments: userId,
      );
    }
  }

  Future<void> logout(BuildContext context) async {
    await client.auth.signOut();
    Navigator.pushReplacementNamed(context, '/login');
  }

  // updateFlashCard(
  //   var frontText,
  //   var backText,
  //   var id,
  // ) async {
  //   debugPrint("t1 : $frontText t2 $backText id : $id  ");
  //   var res = await client.from('card').update({
  //     'front_text': frontText,
  //     'back_text': backText,
  //   }).eq('id', id);
  // }
}
