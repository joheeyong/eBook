import 'dart:async';

import 'package:ebookpod/page/MainPage.dart';
import 'package:ebookpod/util/observer/RiverpodObserver.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'data/LocalStorage.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  LocalStorage();

  runApp(
    ProviderScope(
      observers: [RiverpodObserver()],
      child: const MyApp(),
    ),
  );
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashActivity(),
    );
  }
}

class SplashActivity extends StatefulWidget {
  const SplashActivity({Key? key}) : super(key: key);

  @override
  State<SplashActivity> createState() => SplashActivityState();
}

class SplashActivityState extends State<SplashActivity> {
  @override
  void initState() {
    super.initState();
  }

  void startTimeout() {
    Timer(const Duration(seconds: 2), handleTimeout);
  }

  void handleTimeout() {
    changeScreen();
  }

  Future<void> changeScreen() async {
    Navigator.pushReplacement(
        context,
        PageRouteBuilder(
          pageBuilder: (BuildContext context, Animation<double> animation, Animation<double> secondaryAnimation) => const MainPage(),
          transitionsBuilder: (BuildContext context, Animation<double> animation, Animation<double> secondaryAnimation, Widget child) {
            return FadeTransition(
              opacity: animation,
              child: child,
            );
          },
        ));
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
