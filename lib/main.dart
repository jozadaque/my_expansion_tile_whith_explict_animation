import 'package:flutter/material.dart';
import 'package:my_expansion_tile_whith_explict_animation/my_expansion_tile.dart';

void main() {
  runApp(const HomePage());
}

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('My ExpansionTile')),
        body: ListView(
          children: [
            for (int i = 0; i < 50; i++)
              MyExpansionTile(
                count: i,
              ),
          ],
        ),
      ),
    );
  }
}
