import 'dart:io';

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
import 'package:flutter_learn/101/list_view_builder.dart';
import 'package:flutter_learn/101/list_view_learn.dart';
import 'package:flutter_learn/101/navigation_learn.dart';
import 'package:flutter_learn/101/padding_learn.dart';
import 'package:flutter_learn/101/page_view_learn.dart';
import 'package:flutter_learn/101/stack_learn.dart';
import 'package:flutter_learn/101/stateful_learn.dart';
import 'package:flutter_learn/101/statefull_lifecycle_learn.dart';
import 'package:flutter_learn/101/stateless_learn.dart';
import 'package:flutter_learn/101/text_field_learn.dart';
import 'package:flutter_learn/101/text_learn_view.dart';
import 'package:flutter_learn/202/alert_learn.dart';
import 'package:flutter_learn/202/animated_learn_view.dart';
import 'package:flutter_learn/202/cache/secure_context/secure_context_learn.dart';
import 'package:flutter_learn/202/cache/shared_learn_cache.dart';
import 'package:flutter_learn/202/cache/shared_list_cache.dart';
import 'package:flutter_learn/202/form_learn_view.dart';
import 'package:flutter_learn/202/model_learn_view.dart';
import 'package:flutter_learn/202/oop-learn_view.dart';
import 'package:flutter_learn/202/package_learn_view.dart';
import 'package:flutter_learn/202/service/service_get_learn_view.dart';
import 'package:flutter_learn/202/service/service_post_learn_view.dart';
import 'package:flutter_learn/202/sheet_learn.dart';
import 'package:flutter_learn/202/state_manage/state_manage_learn_view.dart';
import 'package:flutter_learn/202/tab_learn.dart';
import 'package:flutter_learn/202/image_learn202.dart';
import 'package:flutter_learn/202/theme/light_theme.dart';
import 'package:flutter_learn/303/call_back_learn.dart';
import 'package:flutter_learn/303/lottie_learn.dart';
import 'package:flutter_learn/303/reqres_resource/view/reqres_view.dart';
import 'package:flutter_learn/303/tabbar_advanced.dart';
import 'package:flutter_learn/demos/color_demos_view.dart';
import 'package:flutter_learn/demos/color_lifecycle_view.dart';
import 'package:flutter_learn/demos/my_colections_demos.dart';
import 'package:flutter_learn/demos/note_demos_view.dart';
import 'package:flutter_learn/demos/stack_demo_view.dart';
import 'package:flutter_learn/product/constant/project_items.dart';
import 'package:flutter_learn/product/global/resource_context.dart';
import 'package:flutter_learn/product/global/theme_notifier.dart';
import 'package:provider/provider.dart';

// 11. Provider'in buaradki kullanimi:
// ThemeNotifier'i ChangeNotierdan turetip kullaniyorum.
void main() {
  //runApp(const MyApp());
  runApp(MultiProvider(
    providers: [
      Provider(create: (_) => ResourceContext()),
      ChangeNotifierProvider<ThemeNotifier>(
        create: (context) => ThemeNotifier(),
      )
    ],
    builder: (context, child) => MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: ProjectItems.projectName,
        debugShowCheckedModeBanner: false,
        // ap'teki butun appbarlarda bulunan ortak ozellikleri belirt:
        // appbar'i her zaman burada belirt.
        theme: context.watch<ThemeNotifier>().currentTheme,
        //LightTheme().theme,
        // ThemeData.dark().copyWith(
        //     tabBarTheme: const TabBarTheme(
        //       labelColor: Colors.white,
        //       unselectedLabelColor: Colors.red,
        //       indicatorSize: TabBarIndicatorSize.label,
        //     ),
        //     bottomAppBarTheme: const BottomAppBarTheme(shape: CircularNotchedRectangle()),
        //     progressIndicatorTheme: const ProgressIndicatorThemeData(color: Colors.red),
        //     // butun card'lari ayni yapar.
        //     listTileTheme: const ListTileThemeData(contentPadding: EdgeInsets.zero),
        //     cardTheme: CardTheme(shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20))),
        //     // color error duplaceted and i solve that:
        //     colorScheme: Theme.of(context).colorScheme.copyWith(error: ColorsItems.turquaz_blue),
        //     inputDecorationTheme: const InputDecorationTheme(
        //         filled: true,
        //         fillColor: Colors.white,
        //         iconColor: Colors.red,
        //         border: OutlineInputBorder(),
        //         floatingLabelStyle: TextStyle(color: Colors.blue, fontSize: 24, fontWeight: FontWeight.w600)),
        //     // bu sekilde text color'in rengi degisiyor ama butun title medium olanlarda degsiyor.
        //     // text color'i class icinde vermek daa mantıkli temadan vermketen.
        //     textTheme: const TextTheme(titleMedium: TextStyle(color: Colors.red)),
        //     iconTheme: const IconThemeData(),
        //     appBarTheme: const AppBarTheme(
        //       centerTitle: true,
        //       systemOverlayStyle: SystemUiOverlayStyle.light,
        //       backgroundColor: Colors.transparent,
        //       elevation: 0,
        //

        home: const LottieLearn());
  }
}
