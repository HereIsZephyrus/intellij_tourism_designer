import 'package:flutter/material.dart';
import 'package:intellij_tourism_designer/widgets/MapView.dart';
class HomePage extends StatelessWidget {
  static const String route = '/';
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        actions: [
          IconButton(
            icon: const Icon(Icons.login),
            onPressed: () {
              // login
            },
          ),
          IconButton(
            icon: const Icon(Icons.person_add),
            onPressed: () {
              // signup
            },
          ),
          IconButton(
            icon: const Icon(Icons.info),
            onPressed: () {
              // about
            },
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              width: MediaQuery.of(context).size.width * 0.8,
              height: MediaQuery.of(context).size.height * 0.5,
              child: Flex(
                  direction: Axis.horizontal,
                  children: <Widget>[
                    Expanded(
                      flex: 3,
                      child: DemoMap()
                    ),
                    const Expanded(
                      flex: 1,
                      child: Text("用户对话框")
                    )
                  ]
                ),
            )
            
          ],
        ),
      ),
    );
  }
}