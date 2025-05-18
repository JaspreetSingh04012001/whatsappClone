import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CallsScreen extends StatelessWidget {
  CallsScreen({super.key});

  final List<Map<String, String>> recentCalls = [
    {
      "name": "Jass",
      "time": "Yesterday, 5:24 PM",
      "image": "assets/uncle.png",
      "status": "Missed audio call",
    },
    {
      "name": "Raman",
      "time": "Yesterday, 5:23 PM",
      "image": "assets/uncle.png",
      "status": "Outgoing call",
    },
    {
      "name": "Pooja",
      "time": "Yesterday, 1:12 PM",
      "image": "assets/uncle.png",
      "status": "Incoming call",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0,
        actions: [
          IconButton(
            icon: Icon(Icons.qr_code, color: Colors.white),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(Icons.search, color: Colors.white),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(Icons.more_vert, color: Colors.white),
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.fromLTRB(15, 0, 15, 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Favourites",
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10),
            Row(
              children: [
                Icon(
                  CupertinoIcons.plus_circle_fill,
                  color: Colors.green,
                  size: 30,
                ),
                SizedBox(width: 10),
                Text(
                  "Add favourite",
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
              ],
            ),
            SizedBox(height: 20),
            Text(
              "Recent",
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10),
            ListView.separated(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: recentCalls.length,
              separatorBuilder: (context, index) => SizedBox(height: 10),
              itemBuilder: (context, index) {
                var call = recentCalls[index];
                IconData callIcon;
                Color iconColor;

                if (call["status"] == "Missed audio call") {
                  callIcon = Icons.call_missed;
                  iconColor = Colors.red;
                } else if (call["status"] == "Incoming call") {
                  callIcon = Icons.call_received;
                  iconColor = Colors.green;
                } else {
                  callIcon = Icons.call_made;
                  iconColor = Colors.green;
                }

                return Row(
                  children: [
                    CircleAvatar(
                      radius: 25,
                      backgroundImage: AssetImage(
                        call["image"] ?? "assets/uncle.png",
                      ),
                    ),
                    SizedBox(width: 10),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            call["name"] ?? "",
                            style: TextStyle(
                              color:
                                  call["status"] == "Missed audio call"
                                      ? Colors.red
                                      : Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          Row(
                            children: [
                              Icon(callIcon, size: 16, color: iconColor),
                              SizedBox(width: 5),
                              Text(
                                call["time"] ?? "",
                                style: TextStyle(color: Colors.white70),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Icon(Icons.call, color: Colors.white60),
                  ],
                );
              },
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: Colors.green,
        child: Stack(
          alignment: Alignment.center,
          children: [
            Icon(Icons.add_call, color: Colors.white, size: 28),
            Positioned(
              bottom: 4,
              right: 4,
              child: Icon(Icons.video_call, size: 12, color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}