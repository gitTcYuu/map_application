import 'package:flutter/cupertino.dart';

import 'pages/fav_page.dart';
import 'pages/map_page.dart';
import 'pages/profile_page.dart';

class AppRoute {
  static const map = 'map';
  static const fav = 'fav';
  static const profile = 'profile';

  final _route = <String, WidgetBuilder>{
    map: (context) => const MapPage(),
    fav: (context) => const FavPage(),
    profile: (context) => const ProfilePage(),
  };

  final _listPage = [
    const MapPage(),
    const FavPage(),
    const ProfilePage(),
  ];

  get getRouteAll => _route;
  get getPageAll => _listPage;
}
