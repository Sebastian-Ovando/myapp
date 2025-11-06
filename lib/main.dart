import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Contador'),
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
  int _fiveCount = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
      if (_counter > 10) {
        _counter = 0;
      } else if (_counter == 5) {
        _fiveCount++;
      }
    });
  }

  void _resetCounters() {
    setState(() {
      _counter = 0;
      _fiveCount = 0;
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
              'Veces presionado el botón:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                    color: _counter == 10 ? Colors.red : null,
                  ),
            ),
            const SizedBox(height: 20),
            const Text(
              'Veces que llegó a 5:',
            ),
            Text(
              '$_fiveCount',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            onPressed: _incrementCounter,
            tooltip: 'Incrementar',
            child: const Icon(Icons.add),
          ),
          const SizedBox(height: 10),
          FloatingActionButton(
            onPressed: _resetCounters,
            tooltip: 'Reiniciar',
            child: const Icon(Icons.refresh),
          ),
        ],
      ),
    );
  }
}
