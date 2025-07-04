import 'package:flutter/material.dart';

class Keys {
  const Keys._();
  static final GlobalKey<NavigatorState> navigatorKey = GlobalKey();
  static final GlobalKey<ScaffoldState> scaffoldKey =
      GlobalKey<ScaffoldState>();
}
