import 'package:baraka_shop/providers/auth_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../utils/colors.dart';


class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.cFC6828,
      appBar: AppBar(
        title: Text("profile screen"),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              context.read<AuthProvider>().logOut(context);
            },
            icon: const Icon(Icons.logout),
          ),
        ],
      ),
    );
  }
}
