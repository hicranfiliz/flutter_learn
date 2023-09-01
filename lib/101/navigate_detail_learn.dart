import 'package:flutter/material.dart';

class NavigateLearnDart extends StatefulWidget {
  const NavigateLearnDart({super.key, this.isOkay = false});
  final bool isOkay;

  @override
  State<NavigateLearnDart> createState() => _NavigateLearnDartState();
}

class _NavigateLearnDartState extends State<NavigateLearnDart> {
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    // ModalRoute.of(context).settings.arguments;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
          child: ElevatedButton.icon(
              onPressed: () {
                Navigator.of(context).pop(!widget.isOkay);
              },
              icon: Icon(
                Icons.check,
                color: widget.isOkay ? Colors.red : Colors.green,
              ),
              label: widget.isOkay ? const Text('Red') : const Text('Onayla'))),
    );
  }
}
