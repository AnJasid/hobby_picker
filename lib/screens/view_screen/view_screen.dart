import 'package:flutter/material.dart';
import 'package:hobby_picker/screens/view_screen/hobby_list.dart';

class ViewScreen extends StatelessWidget {
  const ViewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        title: const Text('ViewScreen'),
      ),
      body: const HobbyList(),
    );
  }
}
