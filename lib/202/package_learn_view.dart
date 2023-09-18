import 'package:flutter/material.dart';
import 'package:flutter_learn/202/package/loading_bar.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
//import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_learn/202/package_learn_view.dart';

class PackageLearnView extends StatefulWidget {
  const PackageLearnView({super.key});

  @override
  State<PackageLearnView> createState() => _PackageLearnViewState();
}

class _PackageLearnViewState extends State<PackageLearnView> with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // _launchUrl('https://pub.dev/packages/url_launcher');
        },
      ),
      body: Column(
        children: [
          Text(
            'a',
            style: Theme.of(context).textTheme.subtitle1,
          ),
          const LoadingBar(),
        ],
      ),
    );
  }
}

// void _launchUrl(String url) async {
//   if (!await launch(url)) {
//     await launch(url);
//   }
// }
