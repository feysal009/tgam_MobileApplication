import 'package:flutter/material.dart';

class EEGDataPage extends StatefulWidget {
  const EEGDataPage({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _EEGDataPageState createState() => _EEGDataPageState();
}

class _EEGDataPageState extends State<EEGDataPage> {
  List<String> eegData = [
    'Sample 1',
    'Sample 2',
    'Sample 3',
    'Sample 4',
    'Sample 5',
  ];

  void sortData() {
    setState(() {
      eegData.sort();
    });
  }

  void removeData() {
    setState(() {
      eegData.removeLast();
    });
  }

  void saveData() {
    // Logic to save data
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text('EEG Data'),
          centerTitle: true,
          backgroundColor: Colors.blueGrey),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'EEG Data:',
              style: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16.0),
            Expanded(
              child: ListView.builder(
                itemCount: eegData.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(eegData[index]),
                  );
                },
              ),
            ),
            const SizedBox(height: 24.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: sortData,
                  child: const Text('Sort'),
                ),
                ElevatedButton(
                  onPressed: removeData,
                  child: const Text('Remove'),
                ),
                ElevatedButton(
                  onPressed: saveData,
                  child: const Text('Save Data'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
