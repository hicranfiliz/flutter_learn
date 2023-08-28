import 'package:flutter/material.dart';

class CustomWidgetLearn extends StatelessWidget {
  const CustomWidgetLearn({super.key});
  final String title = 'Food';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Center(
              child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: CustomFoodButton(
              title: title,
            ),
          )),
        ],
      ),
    );
  }
}

mixin _ColorsUtility {
  final Color redColor = Colors.red;
  final Color whiteColor = Colors.white;
}

// component'e icten padding verilir ama margin degerini daima bu component'i
// cagirdigimiz yerde vermeliyiz. margin.2i de burada verirsek bu component'in yapisini bpzariz.
mixin _PaddingUtility {
  final EdgeInsets normalPadding = const EdgeInsets.all(8);
  final EdgeInsets normalPadding2 = const EdgeInsets.all(16);
}

class CustomFoodButton extends StatelessWidget
    with _ColorsUtility, _PaddingUtility {
  CustomFoodButton({super.key, required this.title});
  final String title;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
            backgroundColor: redColor, shape: const StadiumBorder()),
        onPressed: () {},
        //herhangi bir font lazim old theme'dan okumaliyim!!
        child: Center(
          child: Padding(
            padding: normalPadding2,
            child: Text(
              title,
              style: Theme.of(context)
                  .textTheme
                  .titleSmall
                  ?.copyWith(color: whiteColor, fontWeight: FontWeight.bold),
            ),
          ),
        ));
  }
}
