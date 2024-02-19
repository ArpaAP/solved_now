import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:solved_now/pages/login.dart';

import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          fontFamily: "Pretendard",
          colorScheme: ColorScheme.fromSeed(
            primary: const Color.fromRGBO(33, 201, 45, 1),
            seedColor: const Color.fromRGBO(33, 201, 45, 1),
          ),
          primaryColorLight: const Color.fromRGBO(115, 230, 122, 1),
          useMaterial3: true,
          scaffoldBackgroundColor: const Color.fromRGBO(245, 247, 250, 1),
          splashColor: Colors.transparent,
          highlightColor: Colors.transparent,
        ),
        home: const LoginPage(),
      ),
    );
  }
}
