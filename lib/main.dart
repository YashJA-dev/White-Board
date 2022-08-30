import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:whiteboard/ProviderWhiteBoard.dart';

import 'Home.dart';

void main() {
  runApp(Main());
}

class Main extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primaryColor: Colors.purple),
      home: ChangeNotifierProvider(
        create: (_) => WhiteBoardProvider(),
        child: Home(),
      ),
    );
  }
}
