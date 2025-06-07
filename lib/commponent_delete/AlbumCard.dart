import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AlbumCard extends StatelessWidget {
  const AlbumCard({
    Key? key,
    required this.index,
  }) : super(key: key);

  final int index;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blue, // Example background color
      child: Center(
        child: Text('Item $index'),
      ),
    );
  }
}
