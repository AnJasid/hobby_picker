import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:math';
import 'package:hobby_picker/data/hobby_data.dart';
import 'package:hobby_picker/model/hobby_model.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  HobbyModel currentHobby =
      const HobbyModel(hobbyTitle: 'Press Reshuffle', hobbyDesc: 'decription');
  bool isShuffling = false;
  Timer? shuffleTimer;

  void startShuffle() {
    isShuffling = true;
    shuffleHobby();
    shuffleTimer = Timer(const Duration(seconds: 3), stopShuffle);
  }

  void stopShuffle() {
    isShuffling = false;
    shuffleTimer?.cancel();
  }

  void shuffleHobby() {
    final random = Random();
    HobbyModel newHobby;
    do {
      newHobby = hobbyDetails[random.nextInt(hobbyDetails.length)];
    } while (newHobby.hobbyTitle == currentHobby.hobbyTitle);

    setState(() {
      currentHobby = newHobby;
    });
    if (isShuffling) {
      shuffleTimer = Timer(const Duration(milliseconds: 100),
          shuffleHobby); // Adjust the duration here
    }
  }

  @override
  void dispose() {
    shuffleTimer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(currentHobby.hobbyTitle,
                  style: const TextStyle(fontSize: 24.0)),
              const SizedBox(height: 20),
              Text(currentHobby.hobbyDesc), // Display the hobby description
              TextButton(
                onPressed: () {
                  if (!isShuffling) {
                    startShuffle();
                  }
                },
                child: const Text('Reshuffle'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
