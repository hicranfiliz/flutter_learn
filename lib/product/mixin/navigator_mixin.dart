import 'package:flutter/material.dart';
import 'package:flutter_learn/101/navigation_learn.dart';
import 'package:flutter_learn/product/navigator/navigator_manager.dart';

mixin NavigatorMixin<T extends StatefulWidget> on State<T>{
NavigatorManager2 get router => NavigatorManager2.instance;
}
