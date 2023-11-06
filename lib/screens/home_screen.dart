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

  // Updated shuffleHobby() method
  void shuffleHobby() {
    final random = Random();
    String newHobbyTitle;
    HobbyModel newHobby;
    do {
      newHobbyTitle =
          hobbyDetails[random.nextInt(hobbyDetails.length)].hobbyTitle;
      newHobby =
          hobbyDetails.firstWhere((hobby) => hobby.hobbyTitle == newHobbyTitle);
    } while (newHobbyTitle == currentHobby.hobbyTitle);

    setState(() {
      currentHobby = newHobby.copyWith(hobbyDesc: '');
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
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 236, 226, 187),
        title: const Text(
          'Home Screen',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/bg.png'),
            opacity: 0.08,
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(30),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 170),
                Text(
                  currentHobby.hobbyTitle,
                  style: const TextStyle(fontSize: 24.0),
                ),
                const SizedBox(height: 50),
                Text(currentHobby.hobbyDesc),
                const Spacer(),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF28b4cc),
                    ),
                    onPressed: () {
                      if (!isShuffling) {
                        startShuffle();
                      }
                    },
                    child: const Text('Reshuffle'),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
