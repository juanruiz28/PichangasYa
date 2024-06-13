import 'package:flutter/material.dart';
import 'package:map2/app/domain/ui/pages/maps/map1.dart';
import 'package:map2/app/domain/ui/routers/routers.dart';

Map<String, Widget Function(BuildContext)> appRoutes() {
  return {
    Routes.HOME: (_) => const map1(),
  };
}
