import 'package:flutter/material.dart';
import 'package:solved_now/pages/login.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

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
          useMaterial3: true,
        ),
        home: const LoginPage(),
      ),
    );
  }
}
