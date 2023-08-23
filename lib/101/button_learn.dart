import 'package:flutter/material.dart';

class ButtonLearn extends StatelessWidget {
  const ButtonLearn({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          TextButton(
            onPressed: () {},
            style: ButtonStyle(
                backgroundColor: MaterialStateProperty.resolveWith((states) {
              if (states.contains(MaterialState.pressed)) {
                return Colors.green;
              }
              return Colors.white;
            })),
            child: Text(
              'Save',
              style: Theme.of(context).textTheme.titleMedium,
            ),
          ),
          // button'u disable yapmak için -> null
          const ElevatedButton(onPressed: null, child: Text('dataas')),
          IconButton(onPressed: () {}, icon: const Icon(Icons.abc_rounded)),
          FloatingActionButton(
            onPressed: () {
              //servise istek at
              // sayfanin rengini duzenle orn.
            },
            child: const Icon(Icons.add),
          ),
          OutlinedButton(
              style: OutlinedButton.styleFrom(
                backgroundColor: Colors.red,
                padding: const EdgeInsets.all(10),
              ),
              onPressed: () {},
              child: const SizedBox(width: 200, child: Text('data'))),
          OutlinedButton.icon(
              onPressed: () {},
              icon: Icon(Icons.abc),
              label: const Text('data')),
          //text'i button gibi kullnamak
          InkWell(onTap: () {}, child: const Text('custom')),

          Container(
            height: 200,
            color: Colors.white,
          ),
          // bosluk:
          const SizedBox(
            height: 10,
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
                primary: Colors.black,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                )),
            onPressed: () {},
            child: Padding(
              //generic'ligi saglamak:
              padding: const EdgeInsets.only(
                  top: 10, bottom: 10, right: 40, left: 40),
              child: Text(
                'Place Bid',
                style: Theme.of(context).textTheme.headlineMedium,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

//Borders:
//CircleBorder(), RoudnedRectangleBorder()
