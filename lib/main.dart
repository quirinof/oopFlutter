import 'package:flutter/material.dart';

void main() {
  MaterialApp app = MaterialApp(
      theme: ThemeData(primarySwatch: Colors.cyan),
      home: Scaffold(
          appBar: AppBar(
            title: const Center(child: Text("MY APP")),
          ),
          body: const Center(
              child: Column(
            children: [
              Text("Just starting..."),
              Text("in middle..."),
              Text("ending.")
            ],
          )),
          bottomNavigationBar: const Text("Next")));

  runApp(app);
}
