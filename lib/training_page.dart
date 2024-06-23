import 'package:flutter/material.dart';



class TrainPage extends StatelessWidget {
  const TrainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('TRAIN'),
        centerTitle: true,
        backgroundColor: Colors.blueGrey,
      ),
      body: Padding(
        padding: const EdgeInsets.all(25.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'How to Use EEG Sensors:',
              style: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 30.0),
            const Text(
              '1. Place the EEG sensors on the appropriate positions on the scalp.',
              style: TextStyle(fontSize: 18.0),
            ),
            const SizedBox(height: 30.0),
            const Text(
              '2. Ensure proper connection and setup with the EEG device.',
              style: TextStyle(fontSize: 18.0),
            ),
            const SizedBox(height: 30.0),
            const Text(
              '3. Start the EEG recording or training process.',
              style: TextStyle(fontSize: 18.0),
            ),
            const SizedBox(height: 40.0),
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/trainNew');
                  },
                  child: const Text('NEW'),
                ),
                const SizedBox(height: 40.0),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/eegData');
                  },
                  child: const Text('TEST'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
