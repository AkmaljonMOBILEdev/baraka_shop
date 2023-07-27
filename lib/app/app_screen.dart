import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/auth_provider.dart';

// class App extends StatelessWidget {
//   const App({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: StreamBuilder<User?>(
//         stream: context.read<AuthProvider>().listenAuthState(),
//         builder: (BuildContext context, AsyncSnapshot<User?> snapshot) {
//           // if (snapshot.connectionState == ConnectionState.waiting) {
//           //   return const Center(child: CircularProgressIndicator());
//           // }
//           if (snapshot.hasError) {
//             return Center(child: Text(snapshot.error.toString()));
//           } else if (snapshot.data == null) {
//             return AuthScreen();
//           } else {
//             return const TabBox();
//           }
//         },
//       ),
//     );
//   }
// }