//bir view'im var ve view'la is yapan katmanlarim modellerim var.
// bu iki katman arasini yoneten ara katman.  Buraya kodlari yaziyoruz..
// initstate vs buraya cikmis hali.
// ben widget'in basinda

// LOGİC'LERI BURADAN YONETIYORUZ.
import 'package:flutter/material.dart';
import 'package:flutter_learn/202/state_manage/state_manage_learn_view.dart';

abstract class StateLearnViewModel extends State<StateManageLearnView> {
  @override
  void initState() {
    super.initState();
  }

  bool isVisible = false;
  bool isOpacity = false;

  void changeVisible() {
    setState(() {
      isVisible = !isVisible;
    });
  }

  void changeOpacity() {
    setState(() {
      isOpacity = !isOpacity;
    });
  }
}
