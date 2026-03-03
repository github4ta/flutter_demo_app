import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

void main() {
  //WidgetsFlutterBinding.ensureInitialized();
  //SemanticsBinding.instance.ensureSemantics();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(primarySwatch: Colors.blue, useMaterial3: true),
      home: const MyHomeScreen(),
    );
  }
}

class MyHomeScreen extends StatefulWidget {
  const MyHomeScreen({super.key});

  @override
  State<MyHomeScreen> createState() => _MyHomeScreenState();
}

class _MyHomeScreenState extends State<MyHomeScreen> {
  // Controller to read text from INPUT
  final TextEditingController _controller = TextEditingController();

  // VARIABLE to store the result
  String _result = "Here your result will be";

  void _updateResult() {
    setState(() {
      _result = _controller.text;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // 1. ЗАГОЛОВОК
      appBar: AppBar(
        title: const Text('Flutter Demo App'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // 2. ПОЛЕ ДЛЯ ВВОДА
            Semantics(
              identifier: 'input-field',
              container: true,
              child: TextField(
                controller: _controller,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Type something',
                  hintText: 'Type something...',
                ),
              ),
            ),
            const SizedBox(height: 20),

            // 3. КНОПКА
            ElevatedButton.icon(
              onPressed: _updateResult,
              icon: const Icon(Icons.check),
              label: const Text('Show what you typed'),
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 12,
                ),
              ),
            ),
            const SizedBox(height: 40),

            // 4. ПОЛЕ ДЛЯ ВЫВОДА
            const Text(
              'Result:',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Container(
              padding: const EdgeInsets.all(15),
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(10),
              ),
              child: Text(
                _result,
                style: const TextStyle(fontSize: 18, color: Colors.blueAccent),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
