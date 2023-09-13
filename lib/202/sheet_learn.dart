import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_learn/101/list_view_learn.dart';
import 'package:flutter_learn/202/image_learn202.dart';

// NAVIGATOR POP ILE GERI DATA GONDERME ISLEMI ONEMLI!!
class SheetLearn extends StatefulWidget {
  const SheetLearn({super.key});

  @override
  State<SheetLearn> createState() => _SheetLearnState();
}

class _SheetLearnState extends State<SheetLearn> with ProductSheetMixin {
  Color _backgroundColor = Colors.white;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        backgroundColor: _backgroundColor,
        body: Center(
            child: TextButton(
          onPressed: () {
            showCustomSheet(context, const ImageLearn202());
          },
          child: const Text(
            'Show',
            style: TextStyle(color: Colors.black),
          ),
        )),
        floatingActionButton: FloatingActionButton(
          onPressed: () async {
            // result atamakla showmodalbottosheet kapandiginda gelen sonucu kontrol edebilecegim.
            final result = await showModalBottomSheet(
                context: context,
                builder: (context) {
                  return _CustomSheet(backgroundColor: _backgroundColor);
                });
            if (result is bool) {
              setState(() {
                _backgroundColor = Colors.blue;
              });
            }
          },
          child: const Icon(Icons.share),
        ));
  }
}

// stateless widget'i stateful widget'a cevirerek hayat verebilrilim.
class _CustomSheet extends StatefulWidget {
  const _CustomSheet({
    super.key,
    required Color backgroundColor,
  });

  @override
  State<_CustomSheet> createState() => _CustomSheetState();
}

class _CustomSheetState extends State<_CustomSheet> {
  Color _backgroundColor = Colors.white;
  final _gripHeight = 24.0;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.only(top: 10.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(
              height: _gripHeight,
              child: Stack(
                alignment: Alignment.topCenter,
                children: [
                  Divider(
                    color: Colors.white,
                    thickness: 5,
                    indent: MediaQuery.of(context).size.width * 0.45,
                    endIndent: MediaQuery.of(context).size.width * 0.45,
                  ),
                  Positioned(
                      right: 10,
                      top: 5,
                      child: InkWell(
                        onTap: () {
                          Navigator.of(context).pop<bool>(true);
                        },
                        child: const Icon(Icons.close),
                      ))
                ],
              ),
            ),
            const Text('data22'),
            Image.network(
              "https://picsum.photos/200/300",
              height: 200,
            ),
            ElevatedButton(
              onPressed: () {
                // contex'i kapat.
                // ama contex'i kapattigimda sayfa ölüyor.

                // bu component'i disari cikardigim icin setstate diyemem..
                // ama statefull widgetA donusturerek setstate ekleyebilrim
                setState(() {
                  _backgroundColor = Colors.green;
                });
                Navigator.of(context).pop<bool>(true);
              },
              child: const Text('OK'),
            )
          ],
        ),
      ),
    );
  }
}

// butun ekranlarda bu sheet'i kullanacaksak..
// eger bir property olacak ve sadece functionlar ureteceksek mixin yapiyoruz..
mixin ProductSheetMixin {
  Future<T?> showCustomSheet<T>(BuildContext context, Widget child) async {
    return showModalBottomSheet<T>(
        context: context,
        backgroundColor: Colors.red,
        barrierColor: Colors.transparent,
        shape: const RoundedRectangleBorder(borderRadius: BorderRadius.vertical(top: Radius.circular(20))),
        builder: (context) {
          return _CustomMainSheet(child: child);
        });
  }
}

//Bu sheet'i her yerde kullanacagim icin buraya cikarttik. Bunun icindeki sizedbox da custom
// oldugu icin bunu da disari cikariyoruz..

class _CustomMainSheet extends StatelessWidget {
  const _CustomMainSheet({super.key, required this.child});
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.only(top: 10.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const _BaseSheetHeader(),
            Expanded(child: child),
            const Text('data22'),
            Image.network(
              "https://picsum.photos/200/300",
              height: 200,
            ),
          ],
        ),
      ),
    );
  }
}

class _BaseSheetHeader extends StatelessWidget {
  const _BaseSheetHeader({
    super.key,
  }) : _gripHeight = 24;

  final double _gripHeight;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: _gripHeight,
      child: Stack(
        alignment: Alignment.topCenter,
        children: [
          Divider(
            color: Theme.of(context).colorScheme.onBackground,
            thickness: 5,
            indent: MediaQuery.of(context).size.width * 0.45,
            endIndent: MediaQuery.of(context).size.width * 0.45,
          ),
          Positioned(
              right: MediaQuery.of(context).size.width * 0.01,
              top: 5,
              child: InkWell(
                onTap: () {
                  Navigator.of(context).pop<bool>(true);
                },
                child: const Padding(
                  padding: PaddingManager.paddingLowAll,
                  child: Icon(Icons.close),
                ),
              ))
        ],
      ),
    );
  }
}

// uygulamada padding claass'imiz mutlaka olsun..
class PaddingManager {
  static const paddingLowAll = EdgeInsets.all(8.0);
}
