import 'package:baraka_shop/providers/auth_provider.dart';
import 'package:baraka_shop/utils/sizebox_extension.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TabBox extends StatelessWidget {
  const TabBox({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Tab Box"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Text("Authenticated"),
          ),
          30.ph,
          ElevatedButton(
            onPressed: () {
              context.read<AuthProvider>().logOut(context);
            },
            child: Text("Log out"),
          )
        ],
      ),
    );
  }
}
