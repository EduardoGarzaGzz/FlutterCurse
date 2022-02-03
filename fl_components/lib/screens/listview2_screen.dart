import 'package:flutter/material.dart';

class ListView2Screen extends StatelessWidget {
  final options = const ['Mega man', 'Metal Gear', 'Super Smash', 'Final Fantasy'];

  const ListView2Screen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('ListView1'),
        ),
        body: ListView.separated(
            itemBuilder: (context, index) => ListTile(
                  title: Text(options[index]),
                  trailing: const Icon(Icons.arrow_forward_ios_outlined),
                ),
            separatorBuilder: (_, __) => const Divider(),
            itemCount: options.length));
  }
}
