import 'package:flutter/material.dart';
import 'package:flutter_learn/101/container._sized_box_learn.dart';

class ScaffoldLearnView extends StatelessWidget {
  const ScaffoldLearnView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Scaffold sample'),
      ),
      body: const Text('Merhaba'),
      backgroundColor: Color.fromARGB(255, 237, 161, 231),
      extendBody: true,
      floatingActionButton: FloatingActionButton(onPressed: () {
        showModalBottomSheet(
            context: context,
            builder: (context) => Container(
                  height: 200,
                  color: Color.fromARGB(255, 206, 208, 148),
                ));
      }),
      floatingActionButtonLocation:
          FloatingActionButtonLocation.miniCenterDocked,
      drawer: const Drawer(
        shadowColor: Colors.red,
      ),
      bottomNavigationBar: Container(
        height: 200,
        decoration: ProjectContainerDecoration(),
        child: BottomNavigationBar(items: const [
          BottomNavigationBarItem(icon: Icon(Icons.abc_outlined), label: 'a'),
          BottomNavigationBarItem(icon: Icon(Icons.abc_outlined), label: 'b'),
        ]),
      ),
    );
  }
}
