import 'package:flutter/material.dart';

class FavPage extends StatelessWidget {
  const FavPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      height: double.infinity,
      width: double.maxFinite,
      child: const Center(
        child: Text('Fav List.'),
      ),
    );
  }
}
