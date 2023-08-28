import 'package:flutter/material.dart';

class ListTileLearn extends StatelessWidget {
  const ListTileLearn({super.key});
  final imageUrl = 'https://picsum.photos/200/300';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Card(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: ListTile(
                  title: Image.network(
                    imageUrl,
                    height: 100,
                    fit: BoxFit.cover,
                  ),
                  onTap: () {},
                  subtitle: const Text('How do you use your card'),
                  leading: const Icon(
                    Icons.money,
                    color: Colors.white,
                  ),
                  trailing: const SizedBox(
                    child: Icon(
                      Icons.chevron_right,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
