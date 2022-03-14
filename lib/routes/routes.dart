import 'package:flutter/material.dart';

import '../screens/navigation/help.dart';

Map<String, Widget Function(BuildContext)> allRoutes = <String, WidgetBuilder>{
  Help.routeName: (BuildContext context) => Help(),
};
