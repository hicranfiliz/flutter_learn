import 'package:flutter/material.dart';

class MyCollectionsDemos extends StatefulWidget {
  const MyCollectionsDemos({super.key});

  @override
  State<MyCollectionsDemos> createState() => _MyCollectionsDemosState();
}

class _MyCollectionsDemosState extends State<MyCollectionsDemos> {
  late List<CollectionModel> _items;
  @override
  void initState() {
    super.initState();
    _items = CollectionItems().items;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 214, 150, 242),
      appBar: AppBar(
        title: const Text('hg'),
      ),
      body: ListView.builder(
        itemCount: _items.length,
        padding: PaddingUtililty().paddingHorizontal,
        itemBuilder: (context, index) {
          return _CategoryCard(model: _items[index]);
        },
      ),
    );
  }
}

class _CategoryCard extends StatelessWidget {
  const _CategoryCard({
    super.key,
    required CollectionModel model,
  }) : _model = model;

  final CollectionModel _model;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: PaddingUtililty().paddingBottom,
      child: SizedBox(
        height: 300,
        child: Padding(
          padding: PaddingUtililty().paddingGeneral,
          child: Column(
            children: [
              //image sigmadiginda expanded ile sıkıstırabiliriz.
              Expanded(
                  child: Image.asset(
                _model.imagePath,
                fit: BoxFit.fill,
              )),
              Padding(
                padding: PaddingUtililty().paddingTop,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [Text(_model.title), Text('${_model.price} ')],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class CollectionModel {
  final String imagePath;
  final String title;
  final int price;

  CollectionModel({required this.imagePath, required this.title, required this.price});
}

class CollectionItems {
  late final List<CollectionModel> items;
  CollectionItems() {
    items = [
      CollectionModel(imagePath: ProjectImages.imageCollection, title: 'Arım', price: 5),
      CollectionModel(imagePath: ProjectImages.imageCollection2, title: 'Balım', price: 5),
      CollectionModel(imagePath: ProjectImages.imageCollection1, title: 'Petegim', price: 5),
      CollectionModel(imagePath: ProjectImages.imageCollection, title: 'Abstract Art3', price: 5)
    ];
  }
}

class PaddingUtililty {
  final paddingTop = const EdgeInsets.only(top: 10);
  final paddingBottom = const EdgeInsets.only(bottom: 20);
  final paddingGeneral = const EdgeInsets.all(20);
  final paddingHorizontal = const EdgeInsets.symmetric(horizontal: 20);
}

class ProjectImages {
  static const imageCollection = 'assets/photo2.png';
  static const imageCollection1 = 'assets/photo3.png';
  static const imageCollection2 = 'assets/photo4.png';
}
