import 'package:flutter/material.dart';
import 'package:expressive_refresh/expressive_refresh.dart';
import 'package:material_new_shapes/material_new_shapes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Expressive Refresh Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const DemoPage(),
    );
  }
}

class DemoPage extends StatefulWidget {
  const DemoPage({super.key});

  @override
  State<DemoPage> createState() => _DemoPageState();
}

class _DemoPageState extends State<DemoPage> {
  final List<String> _items = List.generate(15, (i) => "Item $i");

  Future<void> _onRefresh() async {
    await Future.delayed(const Duration(seconds: 2));
    setState(() {
      _items.insert(0, "New item at ${DateTime.now()}");
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Expressive Refresh Example")),
      body: ExpressiveRefreshIndicator(
        onRefresh: _onRefresh,
        color: Colors.deepPurple,
        polygons: [
          RoundedPolygon.circle(),
          RoundedPolygon.star(numVerticesPerRadius: 5),
          RoundedPolygon.pill(),
        ],
        child: ListView.builder(
          physics: const AlwaysScrollableScrollPhysics(),
          itemCount: _items.length,
          itemBuilder: (context, index) => ListTile(
            title: Text(_items[index]),
          ),
        ),
      ),
    );
  }
}
