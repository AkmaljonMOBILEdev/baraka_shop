import 'package:baraka_shop/ui/auth_screens/login_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../ui/tab_box/tab_box.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: (FirebaseAuth.instance.currentUser == null)
          ? const LoginScreen()
          : const TabBox()

    );
  }
}

