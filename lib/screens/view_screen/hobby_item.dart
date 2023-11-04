import 'package:flutter/material.dart';

class HobbyItem extends StatelessWidget {
  const HobbyItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.transparent,
        border: Border.all(
          color: Colors.blue,
          width: 2.0,
        ),
        borderRadius: BorderRadius.circular(10),
      ),
    );
  }
}
