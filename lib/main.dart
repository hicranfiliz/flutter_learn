import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_learn/101/app_bar.dart';
import 'package:flutter_learn/101/card_learn.dart';
import 'package:flutter_learn/101/color_learn.dart';
import 'package:flutter_learn/101/icon_learn.dart';
import 'package:flutter_learn/101/image_learn.dart';
import 'package:flutter_learn/101/padding_learn.dart';
import 'package:flutter_learn/101/stateless_learn.dart';
import 'package:flutter_learn/101/text_learn_view.dart';
import 'package:flutter_learn/demos/note_demos_view.dart';

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
      debugShowCheckedModeBanner: false,
      // ap'teki butun appbarlarda bulunan ortak ozellikleri belirt:
      // appbar'i her zaman burada belirt.
      theme: ThemeData.dark().copyWith(
          // butun card'lari ayni yapar.
          cardTheme: CardTheme(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20))),
          // color error duplaceted and i solve that:
          colorScheme: Theme.of(context)
              .colorScheme
              .copyWith(error: ColorsItems.turquaz_blue),
          iconTheme: const IconThemeData(),
          appBarTheme: const AppBarTheme(
            centerTitle: true,
            systemOverlayStyle: SystemUiOverlayStyle.light,
            backgroundColor: Colors.transparent,
            elevation: 0,
          )),
      home: const NoteDemos(),
    );
  }
}
