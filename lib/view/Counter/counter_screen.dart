import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_provider/Provider/counter_provider.dart';
import 'package:todo_provider/main.dart';
import 'package:todo_provider/view/Counter/utils/shared_preferences.dart';

class CounterScreen extends StatelessWidget {
  const CounterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    SharedPreferencesHelper sharedPreferencesHelper = SharedPreferencesHelper();
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(context.watch<CounterProvider>().count.toString()),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                    onPressed: () {
                      context.read<CounterProvider>().increment();
                    },
                    child: Text('+')),
                ElevatedButton(
                    onPressed: () {
                      context.read<CounterProvider>().dicrement();
                    },
                    child: Text('-')),
              ],
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          await sharedPreferencesHelper.addValueInteger('counter', 100);
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
