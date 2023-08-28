import 'package:flutter/material.dart';
import 'package:flutter_learn/core/random_image.dart';

class StackDemoView extends StatelessWidget {
  const StackDemoView({super.key});
  final _cardHeight = 50.0;
  final _cardWidht = 200.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(children: [
        Expanded(
          flex: 4,
          child: Stack(
            alignment: Alignment.center,
            children: [
              Positioned.fill(
                // image'i alttan 25 kaldirdim.
                bottom: _cardHeight / 2,
                child: const RandomImage(),
              ),
              // hangisi daha one gelsin istiyorsam en son onu yazarim.
              // positionned'in icindeki alani disari cikart. positioned kalabilir.
              Positioned(
                  // asagidan baslamasi icin bottom:0
                  height: _cardHeight,
                  width: _cardWidht,
                  bottom: 0,
                  child: _cardCustom())
            ],
          ),
        ),
        const Spacer(
          flex: 6,
        )
      ]),
    );
  }

  Card _cardCustom() {
    return const Card(
      color: Colors.white,
      shape: RoundedRectangleBorder(),
    );
  }
}
