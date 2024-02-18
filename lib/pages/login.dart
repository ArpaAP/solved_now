import 'package:flutter/material.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:solved_now/layout.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();

  handleLogin() {
    if (_formKey.currentState!.validate()) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const Layout(),
        ),
        // PageTransition(
        //   curve: Curves.easeInOut,
        //   type: PageTransitionType.fade,
        //   child: const HomePage(),
        // ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Expanded(child: SizedBox()),
            const Text(
              '환영합니다!',
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              '시작하기 위해 먼저 BOJ 아이디로 로그인해주세요.',
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            const SizedBox(height: 20),
            Form(
              key: _formKey,
              child: Column(
                children: <Widget>[
                  TextFormField(
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return '아이디를 입력하세요.';
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: const Color.fromRGBO(235, 236, 243, 1),
                      border: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      isDense: true,
                      contentPadding: const EdgeInsets.symmetric(
                        vertical: 10,
                        horizontal: 10,
                      ),
                      hintText: "Baekjoon OJ 아이디",
                    ),
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    onFieldSubmitted: (text) async {
                      final SharedPreferences prefs =
                          await SharedPreferences.getInstance();

                      await prefs.setString('bojId', text);

                      handleLogin();
                    },
                    textInputAction: TextInputAction.go,
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      Expanded(
                        child: ElevatedButton(
                          onPressed: handleLogin,
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all(
                              Theme.of(context).primaryColor,
                            ),
                            shape: MaterialStateProperty.all<
                                RoundedRectangleBorder>(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                          ),
                          child: const Text(
                            '로그인',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                            ),
                          ),
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
            const Expanded(child: SizedBox()),
            const Divider(height: 32, thickness: 0.5),
            Text.rich(
              TextSpan(
                style: Theme.of(context)
                    .textTheme
                    .bodySmall
                    ?.apply(color: Colors.grey.shade600),
                children: const [
                  TextSpan(text: '이 앱은 solved.ac '),
                  TextSpan(
                    text: '비공식 ',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  TextSpan(
                    text: '서비스로서, shiftpsh 및 solved.ac와 '
                        '어떠한 관련도 없음을 알려드립니다.',
                  ),
                ],
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 8),
            Align(
              alignment: Alignment.center,
              child: FutureBuilder(
                future: PackageInfo.fromPlatform(),
                builder: (BuildContext context,
                    AsyncSnapshot<PackageInfo> snapshot) {
                  final data = snapshot.data;

                  return Text(
                    snapshot.hasData
                        ? '버전 ${data?.version}  |   빌드 번호 ${data?.buildNumber}'
                        : '',
                    style: Theme.of(context).textTheme.bodySmall?.apply(
                          color: Colors.grey.shade600,
                          fontSizeDelta: -2,
                        ),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
