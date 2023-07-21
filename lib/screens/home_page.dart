import 'package:flutter/material.dart';
import 'package:news_app_ui_design/screens/discover_screen.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home Page"),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(MaterialPageRoute(builder: (context) => const DiscoverScreen()));
        },
        child: Icon(Icons.forward),
      ),
    );
  }
}
