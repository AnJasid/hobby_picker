import 'package:flutter/material.dart';
import 'package:hobby_picker/data/hobby_data.dart';

class HobbyList extends StatelessWidget {
  const HobbyList({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: hobbyDetails.length,
      itemBuilder: (BuildContext context, index) => Container(),
    );
  }
}
