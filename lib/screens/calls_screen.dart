import 'package:flutter/material.dart';

class CallsScreen extends StatelessWidget {
  final bool isDarkMode;

  const CallsScreen({super.key, this.isDarkMode = false});

  @override
  Widget build(BuildContext context) {
    final bgColor = isDarkMode ? Colors.black : Colors.white;
    final textColor = isDarkMode ? Colors.white : Colors.black87;
    final List<Map<String, dynamic>> calls = [
      {
        "name": "Jass",
        "time": "Today, 10:32 AM",
        "incoming": true,
        "video": false,
      },
      {
        "name": "Raman",
        "time": "Yesterday, 7:20 PM",
        "incoming": false,
        "video": true,
      },
      {
        "name": "Pooja chauhan",
        "time": "Tuesday, 3:15 PM",
        "incoming": true,
        "video": true,
      },
    ];

    return Scaffold(
      backgroundColor: bgColor,
      appBar: AppBar(
        backgroundColor: bgColor,
        elevation: 0,
        iconTheme: IconThemeData(color: textColor),
      ),
      body: ListView.separated(
        itemCount: calls.length,
        separatorBuilder: (_, __) => Divider(
          height: 1,
          color: isDarkMode ? Colors.grey[800] : Colors.grey[300],
        ),
        itemBuilder: (context, index) {
          final call = calls[index];
          final String name = call['name'] ?? 'Unknown';
          final String time = call['time'] ?? '';
          final bool incoming = call['incoming'] ?? true;
          final bool video = call['video'] ?? false;
          return ListTile(
            leading: const CircleAvatar(
              radius: 25,

            ),
            title: Text(
              name,
              style: TextStyle(color: textColor, fontWeight: FontWeight.bold),
            ),
            subtitle: Row(
              children: [
                Icon(
                  incoming ? Icons.call_received : Icons.call_made,
                  color: incoming ? Colors.red : Colors.green,
                  size: 16,
                ),
                const SizedBox(width: 4),
                Text(time, style: TextStyle(color: textColor.withOpacity(0.6))),
              ],
            ),
            trailing: Icon(
              video ? Icons.videocam : Icons.call,
              color: textColor,
            ),
            onTap: () {
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.green,
        onPressed: () {
        },
        child: const Icon(Icons.add_ic_call),
      ),
    );
  }
}