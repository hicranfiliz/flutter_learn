import 'package:flutter/material.dart';

class IndicatorLearn extends StatelessWidget {
  const IndicatorLearn({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        //basiklik old icin center'a sarmala.
        actions: const [CenterCircularWidget()],
      ),
      body: const LinearProgressIndicator(),
    );
  }
}

class CenterCircularWidget extends StatelessWidget {
  const CenterCircularWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: CircularProgressIndicator(
        strokeWidth: 10,
        value: 0.9,
        backgroundColor: Colors.white,
      ),
    );
  }
}
