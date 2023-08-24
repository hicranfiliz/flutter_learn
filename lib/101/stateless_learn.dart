import 'package:flutter/material.dart';

class StatelessLearn extends StatelessWidget {
  @override
  // build ixinde ekranlari gelistiririz.
  // her widget'in kendine ozel bir build metodu vardir.
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          TitleTextWidget(
            title: 'hicran',
          ),
          _emptyBox(),
          TitleTextWidget(
            title: 'ravza',
          ),
          _emptyBox(),
          TitleTextWidget(
            title: 'gorkem',
          ),
          _emptyBox(),
          TitleTextWidget(
            title: 'filiz',
          ),
          _emptyBox(),
          TitleTextWidget(
            title: 'nur',
          ),
          const _CustomContainer(),
          _emptyBox(),
        ],
      ),
    );
  }

// bu sekilde basit componentleri stateless widget yapmamıza gerek yok. function olarak kullanabiliriz.
  SizedBox _emptyBox() => SizedBox(height: 10);
}

// compponent sadece bu sinifta kullnailabilsin diye _ koyarak private yaptik.
class _CustomContainer extends StatelessWidget {
  const _CustomContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20), color: Colors.red),
    );
  }
}

// disaridan parametre almak.
class TitleTextWidget extends StatelessWidget {
  TitleTextWidget({Key? key, required this.title}) : super(key: key);
  // statless widget kullanıyorsak buarda en oneli nokta disariadn alacagimiz paramterelerin yonetimidir.
  // bu stateless yani degismez oldgu icin stringi nullable yaparız. nullable yaptıktan sonra
  // yukarida key icinde mutlaka degeri olmasi lazim.
  // bu sekilde icine hicbir deger yazmasa d a olur. ama yazmak zorunlu olsun istiyorask this.titledan once requireed yazmaliyiz.
  final String title;

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: Theme.of(context).textTheme.headlineSmall,
    );
  }
}
