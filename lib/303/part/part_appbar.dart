// bir dosyayla diger dosyayi haberlestirmek icin part, part of kullaniyoruz..
// ayni folder'daysa . sonra dosya adi.
part of './part_of_learn.dart';

class _PartOfAppbar extends StatelessWidget implements PreferredSizeWidget, TickerProvider {
  const _PartOfAppbar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: const Text('a'),
      actions: [IconButton(onPressed: () {}, icon: const Icon(Icons.abc_rounded))],
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Ticker createTicker(TickerCallback onTick) {
    // TODO: implement createTicker
    throw UnimplementedError();
  }
}
