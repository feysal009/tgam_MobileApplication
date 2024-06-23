import 'package:flutter/material.dart';


class TrainNewPage extends StatelessWidget {
  const TrainNewPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('TRAIN NEW'),
        centerTitle: true,
        backgroundColor: Colors.blueGrey,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Brain Signals:',
              style: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16.0),
            // Placeholder for waveform chart (you can replace this with your actual chart widget)
            Container(
              height: 200, // Adjust height as needed
              color: Colors.grey[300],
              child: const Center(
                child: Text(
                  'Waveform Chart',
                  style: TextStyle(fontSize: 24.0),
                ),
              ),
            ),
            const SizedBox(height: 24.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _ControlButton(
                  label: 'Play',
                  onPressed: () {
                    // Start capturing brain signals
                    print('Play button pressed');
                  },
                ),
                _ControlButton(
                  label: 'Pause',
                  onPressed: () {
                    // Pause capturing brain signals
                    print('Pause button pressed');
                  },
                ),
                _ControlButton(
                  label: 'Stop',
                  onPressed: () {
                    // Stop capturing brain signals
                    print('Stop button pressed');
                  },
                ),
                _ControlButton(
                  label: 'Reset',
                  onPressed: () {
                    // Reset brain signals data
                    print('Reset button pressed');
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _ControlButton extends StatelessWidget {
  final String label;
  final VoidCallback onPressed;

  const _ControlButton({
    required this.label,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      child: Text(label),
    );
  }
}
