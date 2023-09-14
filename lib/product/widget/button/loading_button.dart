import 'dart:isolate';

import 'package:flutter/material.dart';

class LoadingButton extends StatefulWidget {
  const LoadingButton({super.key, required this.title, required this.onPressed});
  final String title;
  final Future<void> Function() onPressed;
  @override
  State<LoadingButton> createState() => _LoadingButtonState();
}

class _LoadingButtonState extends State<LoadingButton> {
  bool _isLoading = false;

  void _changeLoading() {
    setState(() {
      _isLoading = !_isLoading;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: ElevatedButton(
        child: Center(
          child: _isLoading ? const CircularProgressIndicator() : Text(widget.title),
        ),
        onPressed: () async {
          // isLoading'de olursa buttona bidaha basmasin..
          if (_isLoading) return;
          _changeLoading();
          // bunun aksiyon olmamasinin sebebi bu islemin beklememesi..
          // yani bunu beklemsi icin -> typei Future ve basina await atmam gerekityor.
          // bu durumda request'i bekliyorum..
          await widget.onPressed.call();
          _changeLoading();
        },
      ),
    );
  }
}
