import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_learn/101/app_bar.dart';
import 'package:flutter_learn/101/card_learn.dart';
import 'package:flutter_learn/101/color_learn.dart';
import 'package:flutter_learn/101/column_row_learn.dart';
import 'package:flutter_learn/101/custom_widget_learn.dart';
import 'package:flutter_learn/101/icon_learn.dart';
import 'package:flutter_learn/101/image_learn.dart';
import 'package:flutter_learn/101/indicator_learn.dart';
import 'package:flutter_learn/101/list_tile_learn.dart';
import 'package:flutter_learn/101/padding_learn.dart';
import 'package:flutter_learn/101/page_view_learn.dart';
import 'package:flutter_learn/101/stack_learn.dart';
import 'package:flutter_learn/101/stateful_learn.dart';
import 'package:flutter_learn/101/statefull_lifecycle_learn.dart';
import 'package:flutter_learn/101/stateless_learn.dart';
import 'package:flutter_learn/101/text_learn_view.dart';
import 'package:flutter_learn/demos/note_demos_view.dart';
import 'package:flutter_learn/demos/stack_demo_view.dart';

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
            progressIndicatorTheme: const ProgressIndicatorThemeData(color: Colors.red),
            // butun card'lari ayni yapar.
            listTileTheme: const ListTileThemeData(contentPadding: EdgeInsets.zero),
            cardTheme: CardTheme(shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20))),
            // color error duplaceted and i solve that:
            colorScheme: Theme.of(context).colorScheme.copyWith(error: ColorsItems.turquaz_blue),
            iconTheme: const IconThemeData(),
            appBarTheme: const AppBarTheme(
              centerTitle: true,
              systemOverlayStyle: SystemUiOverlayStyle.light,
              backgroundColor: Colors.transparent,
              elevation: 0,
            )),
        home: const StatefulLifeCycleLearn(message: "hicran"));
  }
}
