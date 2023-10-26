import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<String> items = [
    'Item 1',
    'Item 2',
    'Item 3',
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: RefreshIndicator(
        onRefresh: () async {
          await Future.delayed(Duration(seconds: 2));
          int nextitem = items.length + 1;
          items.add("Item ${nextitem}");
          setState(() {});
        },
        child: ListView.builder(
          itemCount: items.length,
            itemBuilder: ((context, index) => Padding(
                  padding: EdgeInsets.all(8),
                  child: ListTile(
                    title: Text(items[index]),
                    tileColor: Colors.blue,
                  ),
                )
            ),
          padding: EdgeInsets.all(5),
        ),
      ),
    ));
  }
}
