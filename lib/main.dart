import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:map_application/blocs/map/map_bloc.dart';
import 'package:map_application/route.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => MapBloc()..add(LoadMap()),
        ),
      ],
      child: MaterialApp(
        title: 'Map Application',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        routes: AppRoute().getRouteAll,
        debugShowCheckedModeBanner: false,
        home: const MyHomePage(title: 'Google Map API'),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _currentPageIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        title: Text(widget.title, style: TextStyle(color: Colors.grey[700])),
        actions: [
          IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.more_vert_outlined,
                color: Colors.grey[700],
              ))
        ],
      ),
      body: AppRoute().getPageAll[_currentPageIndex],
      bottomNavigationBar: NavigationBar(
        backgroundColor: Colors.white,
        selectedIndex: _currentPageIndex,
        animationDuration: const Duration(seconds: 1),
        destinations: [
          NavigationDestination(
              icon: Icon(
                Icons.explore_rounded,
                color: Colors.grey[300],
              ),
              selectedIcon: Icon(
                Icons.explore_rounded,
                color: Colors.grey[700],
              ),
              label: 'Map'),
          NavigationDestination(
              icon: Icon(
                Icons.favorite_outline,
                color: Colors.grey[300],
              ),
              selectedIcon:
                  Icon(Icons.favorite_rounded, color: Colors.grey[700]),
              label: 'Fav'),
          NavigationDestination(
              icon: Icon(Icons.person_outline_rounded, color: Colors.grey[300]),
              selectedIcon: Icon(Icons.person_rounded, color: Colors.grey[700]),
              label: 'Profile'),
        ],
        onDestinationSelected: (int index) => setState(() {
          _currentPageIndex = index;
        }),
      ),
    );
  }
}
