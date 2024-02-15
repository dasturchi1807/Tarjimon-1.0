import 'package:flutter/material.dart';
import 'body.dart';

void main() => runApp(const App());

//                Dasturning bosh qismi
class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Home(),
    );
  }
}

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange,
        centerTitle: true,
        title: const Text("Tarjimon 1.0",
        style: TextStyle(
          fontSize: 30
        ),),
      ),
      body: const Body(),
    );
  }
}
