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
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.8,
              height: MediaQuery.of(context).size.height * 0.6,
              child: const Flex(
                  direction: Axis.horizontal,
                  children: <Widget>[
                    Expanded(
                      flex: 4,
                      child: DemoMap()
                    ),
                    Expanded(
                      flex: 1,
                      child: Text("这里应该是一个用户对话框,不过还没开发,地图可以拖动和缩放.")
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