import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:providerdemo/list_provider.dart';

class SecondPage extends StatefulWidget {
  const SecondPage({super.key});

  @override
  State<SecondPage> createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  @override
  Widget build(BuildContext context) {
    return Consumer<NumbersListProvider>(
        builder: (context, mani, child) => Scaffold(
              appBar: AppBar(
                title: const Text('Provider Demo'),
              ),
              body: SizedBox(
                  child: Column(
                children: [
                  Text(
                    mani.numbers.last.toString(),
                    style: const TextStyle(fontSize: 30),
                  ),
                  SizedBox(
                    height: 200,
                    width: double.maxFinite,
                    child: ListView.builder(
                        itemCount: mani.numbers.length,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          return Text(
                            mani.numbers[index].toString(),
                            style: const TextStyle(fontSize: 30),
                          );
                        }),
                  )
                ],
              )),
              floatingActionButton: FloatingActionButton(
                onPressed: () {
                  mani.add();
                },
                child: const Icon(Icons.add),
              ),
            ));
  }
}
