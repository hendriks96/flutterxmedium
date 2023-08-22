import 'package:flutter/material.dart';
import 'package:shared_preference_example/home_page.dart';
import 'package:shared_preference_example/login_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    onInit();
  }

  void onInit() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final isLogin = prefs.getBool('islogin') ?? false;

    if (isLogin) {
      Future.delayed(const Duration(seconds: 5)).then(
        (value) => Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (context) => const HomePage())),
      );
    } else {
      Future.delayed(const Duration(seconds: 5)).then(
        (value) => Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (context) => const LoginPage())),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Stack(
          children: [
            Align(
              child: FlutterLogo(
                size: MediaQuery.of(context).size.width / 3,
              ),
            ),
            const Align(
              alignment: Alignment.bottomCenter,
              child: CircularProgressIndicator(),
            )
          ],
        ),
      ),
    );
  }
}
