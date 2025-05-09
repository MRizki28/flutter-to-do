import 'package:flutter/material.dart';

class BottomBar extends StatelessWidget {
  final int currentIndex;
  final Function(int) onTap;

  const BottomBar({super.key, required this.currentIndex, required this.onTap});


  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: currentIndex,
      onTap: onTap,
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.list),
          label: 'Todo',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.check),
          label: 'Done',
        ),
      ],
    );
  }
}
