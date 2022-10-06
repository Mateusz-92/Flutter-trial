import 'package:flutter/cupertino.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:supabase/supabase.dart';
import 'package:uuid/uuid.dart';
import 'package:flutter/material.dart';

var supabaseUrl = dotenv.env["API_URL"] ?? "Api not faund";
var supabaseKey = dotenv.env["API_KEY"] ?? '';

class SupabaseManager {
  final client = SupabaseClient(
    supabaseUrl,
    supabaseKey,
  );

  var uuid = const Uuid();
  getCardBoxData(String datatable) async {
    var response = await client.from(datatable).select().execute();
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

  addHomeCardData(
    String datatableName,
    var textForm,
  ) async {
    await client.from(datatableName).insert([
      {'name': textForm, 'id': uuid.v4()}
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
    //debugPrint("email: $email password: $password");
    final result = await client.auth.signIn(email: email, password: password);
    if (result.data != null) {
      Navigator.pushReplacementNamed(context, '/home_card');
    }
  }
}
