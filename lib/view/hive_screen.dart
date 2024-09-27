import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

class HiveScreen extends StatefulWidget {
  const HiveScreen({super.key});

  @override
  State<HiveScreen> createState() => _HiveScreenState();
}

class _HiveScreenState extends State<HiveScreen> {
  final TextEditingController _controller = TextEditingController();

  List _country = ['Bangladesh', 'India'];
  Box? _countryBox;

  @override
  void initState() {
    _countryBox = Hive.box('country-list');
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Hive'),
      ),
      body: Column(
        children: [
          TextFormField(
            controller: _controller,
          ),
          SizedBox(
            height: 10,
          ),
          ElevatedButton(
              onPressed: () {
                _countryBox?.add(_controller.text);
              },
              child: Text('Submit')),
          SizedBox(
            height: 10,
          ),
          Expanded(
              child: ValueListenableBuilder(
            valueListenable: Hive.box('country-list').listenable(),
            builder: (context, value, child) {
              return ListView.builder(
                itemCount: _countryBox?.keys.toList().length,
                itemBuilder: (context, index) {
                  return Card(
                    child: ListTile(
                      title: Text(_countryBox?.getAt(index)),
                    ),
                  );
                },
              );
            },
          ))
        ],
      ),
    );
  }
}
