import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:providerdemo/list_provider.dart';
import 'package:providerdemo/secondpage.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Consumer<NumbersListProvider>(
        builder: (context, numbersProviderModel, child) => Scaffold(
              appBar: AppBar(
                title: const Text('Provider Demo'),
              ),
              body: SizedBox(
                  child: Column(
                children: [
                  Text(
                    numbersProviderModel.numbers.last.toString(),
                    style: const TextStyle(fontSize: 30),
                  ),
                  Expanded(
                    child: ListView.builder(
                        itemCount: numbersProviderModel.numbers.length,
                        itemBuilder: (context, index) {
                          return Text(
                            numbersProviderModel.numbers[index].toString(),
                            style: const TextStyle(fontSize: 30),
                          );
                        }),
                  ),
                  ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const SecondPage()));
                      },
                      child: const Text("Second"))
                ],
              )),
              floatingActionButton: FloatingActionButton(
                onPressed: () {
                  numbersProviderModel.add();
                },
                child: const Icon(Icons.add),
              ),
            ));
  }
}
