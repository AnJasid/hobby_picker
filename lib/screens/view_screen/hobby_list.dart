import 'package:flutter/material.dart';
import 'package:hobby_picker/data/hobby_data.dart';
import 'package:hobby_picker/screens/view_screen/hobby_item.dart';

class HobbyList extends StatelessWidget {
  const HobbyList({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: const EdgeInsets.symmetric(
        horizontal: 30,
        vertical: 30,
      ),
      itemCount: hobbyDetails.length,
      itemBuilder: (BuildContext context, index) => const HobbyItem(),
      separatorBuilder: (BuildContext context, index) =>
          const SizedBox(height: 20),
    );
  }
}
