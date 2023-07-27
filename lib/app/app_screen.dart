import 'package:baraka_shop/ui/auth_screens/sign_up_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../ui/tab_box/tab_box.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: (FirebaseAuth.instance.currentUser == null)
          ? SignUpScreen()
          : TabBox()

    );
  }
}

// StreamBuilder<User?>(
// stream: context.read<AuthProvider>().listenAuthState(),
// builder: (BuildContext context, AsyncSnapshot<User?> snapshot) {
// // if (snapshot.connectionState == ConnectionState.waiting) {
// //   return const Center(child: CircularProgressIndicator());
// // }
// if (snapshot.hasError) {
// return Center(child: Text(snapshot.error.toString()));
// } else if (snapshot.data == null) {
// return const SignUpScreen();
// } else {
// return const TabBox();
// }
// },
// )