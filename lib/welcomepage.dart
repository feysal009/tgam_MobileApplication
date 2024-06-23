import 'package:flutter/material.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Welcome to EEG App'),
        centerTitle: true,
        backgroundColor: Colors.blueGrey,
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pushReplacementNamed(context, '/train');
            },
            icon: const Icon(Icons.grain_rounded),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 16.0),
            const Text(
              'Welcome, Feisal!',
              style: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16.0),
            Container(
              height: 200,
              color: Colors.grey[300],
              child: const Center(
                child: Text(
                  'Graphical Presentation of Brain Signals',
                  style: TextStyle(fontSize: 18.0),
                ),
              ),
            ),
            const SizedBox(height: 16.0),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _FrequencyBox(
                  title: 'Alpha',
                  frequency: '0.1 Hz',
                ),
                _FrequencyBox(title: 'Beta', frequency: '0.2 Hz'),
                _FrequencyBox(
                  title: 'Gamma',
                  frequency: '0.3 Hz',
                ),
                _FrequencyBox(title: 'Theta', frequency: '0.5 Hz'),
                _FrequencyBox(title: 'Delta', frequency: '0.7 Hz'),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _FrequencyBox extends StatelessWidget {
  final String title;
  final String frequency;

  const _FrequencyBox({
    required this.title,
    required this.frequency,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        color: Colors.grey,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            title,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 18.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8.0),
          Text(
            frequency,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 16.0,
            ),
          ),
        ],
      ),
    );
  }
}
