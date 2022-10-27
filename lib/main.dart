import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:my_app/addSubjectAndCard.dart';
import 'package:my_app/addSubjectForm.dart';
import 'package:my_app/addFlashCard.dart';
import 'package:my_app/flashCardList.dart';
import 'package:my_app/homeCard.dart';
import 'package:my_app/login.dart';
import 'package:my_app/subjectCardList.dart';
import 'signUpScreen.dart';

import 'addHomeCardTmp.dart';

Future<void> main() async {
  await dotenv.load(fileName: '.env');
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(routes: {
      '/card': (_) => const FlashCard(),
      '/flashcard': (_) => const FlashCardList(),
      '/add_subject': (_) => const AddSubjectForm(),
      '/subcject': (_) => const Subject(),
      '/add_home_card': (_) => const AddHomeCardTmp(),
      '/sign_up_screen': (_) => const SignupScreen(),
      '/home_card': (_) => const HomeCard(),
      '/login': (_) => const LoginScreen(),
    }, home: const SignupScreen());
  }
}
