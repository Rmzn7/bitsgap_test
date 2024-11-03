import 'package:bitsgap_test/features/home/controller/characters_store.dart';
import 'package:bitsgap_test/features/home/ui/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Provider<CharactersStore>(
      create: (_) => CharactersStore(),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          textTheme: GoogleFonts.latoTextTheme().copyWith(
              displaySmall: const TextStyle(fontSize: 14, fontWeight: FontWeight.w500, color: Color(0xFF808080)),
              displayMedium: const TextStyle(fontSize: 14, fontWeight: FontWeight.w700, color: Color(0xFF1F1F1F)),
              displayLarge: const TextStyle(fontSize: 16, fontWeight: FontWeight.w700, color: Color(0xFF1F1F1F))
          ),
          colorScheme: ColorScheme.fromSeed(seedColor: Color(0xFFF8F8F8)),
          useMaterial3: false,
        ),
        home:  HomeScreen(),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
