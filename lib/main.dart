import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Jai Ganesha"),
        ),
        body: const MyApp(),
      ),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // const data = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      // ignore: avoid_unnecessary_containers
      home: const Center(
        child: TextField(
          decoration: InputDecoration(
            hintText: 'Enter your message',
            labelText: 'Message',
            border: OutlineInputBorder(),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.grey),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.blue),
            ),
            // errorBorder: OutlineInputBorder(
            //   borderSide: BorderSide(color: Colors.red),
            // ),
            // errorText: 'Please enter a valid message',
          ),
        ),
      ),
    );
  }
}
