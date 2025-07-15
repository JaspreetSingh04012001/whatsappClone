import 'dart:async'; // Import for Timer
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:whatsappclone/chat/chatController.dart';

import '../../chat/Model/chat_tile_user.dart';

enum StatusType { text, image, video }

class MyStatus {
  final StatusType type;
  final dynamic content; // String for text, File or Uint8List for media
  MyStatus(this.type, this.content);
}

class StatusScreen extends StatefulWidget {
  const StatusScreen({super.key});
  @override
  _StatusScreenState createState() => _StatusScreenState();
}

class _StatusScreenState extends State<StatusScreen> {
  final picker = ImagePicker();

  final List<MyStatus> myStatuses = [];
  final List<ChatTileUser> others = Get.find<ChatController>().users ?? [];

  Future<void> _addText() async {
    final text = await showModalBottomSheet<String>(
      context: context,
      isScrollControlled: true,
      builder: (c) {
        final ctrl = TextEditingController();
        return Padding(
          padding: EdgeInsets.only(
            bottom: MediaQuery.of(c).viewInsets.bottom,
            left: 16,
            right: 16,
            top: 16,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: ctrl,
                decoration: const InputDecoration(hintText: 'Write here....'),
              ),
              const SizedBox(height: 8),
              ElevatedButton(
                onPressed: () => Navigator.pop(c, ctrl.text.trim()),
                child: const Text('Upload'),
              ),
              const SizedBox(height: 30),
            ],
          ),
        );
      },
    );
    if (text != null && text.isNotEmpty) {
      setState(() => myStatuses.add(MyStatus(StatusType.text, text)));
    }
  }

  Future<void> _addMedia({
    required bool allowVideo,
    bool onlyImage = false,
  }) async {
    StatusType? type;
    if (onlyImage) {
      type = StatusType.image;
    } else {
      final choice =
          allowVideo
              ? await showModalBottomSheet<StatusType>(
                context: context,
                builder:
                    (c) => Wrap(
                      children: [
                        ListTile(
                          leading: const Icon(Icons.photo),
                          title: const Text('Image'),
                          onTap: () => Navigator.pop(c, StatusType.image),
                        ),
                        ListTile(
                          leading: const Icon(Icons.videocam),
                          title: const Text('Video'),
                          onTap: () => Navigator.pop(c, StatusType.video),
                        ),
                      ],
                    ),
              )
              : null;
      if (choice == null) return;
      type = choice;
    }

    XFile? picked;
    if (type == StatusType.image) {
      picked = await picker.pickImage(source: ImageSource.gallery);
    } else if (type == StatusType.video) {
      picked = await picker.pickVideo(source: ImageSource.gallery);
    }
    if (picked == null) return;

    dynamic contentValue;
    if (kIsWeb) {
      contentValue = await picked.readAsBytes();
    } else {
      contentValue = File(picked.path);
    }
    setState(() => myStatuses.add(MyStatus(type!, contentValue)));
  }

  void _showAllOptions() => showModalBottomSheet<void>(
    context: context,
    builder:
        (c) => Wrap(
          children: [
            ListTile(
              leading: const Icon(Icons.edit),
              title: const Text('Text'),
              onTap: () {
                Navigator.pop(c);
                _addText();
              },
            ),
            ListTile(
              leading: const Icon(Icons.photo),
              title: const Text('Image'),
              onTap: () {
                Navigator.pop(c);
                _addMedia(allowVideo: false, onlyImage: true);
              },
            ),
            ListTile(
              leading: const Icon(Icons.videocam),
              title: const Text('Video'),
              onTap: () {
                Navigator.pop(c);
                _addMedia(allowVideo: true);
              },
            ),
          ],
        ),
  );

  @override
  Widget build(BuildContext context) {
    final lastStatus = myStatuses.isNotEmpty ? myStatuses.last : null;
    return Scaffold(
      body: ListView(
        children: [
          ListTile(
            leading: GestureDetector(
              onTap: _showAllOptions,
              child: CircleAvatar(
                radius: 26,
                backgroundImage:
                    (lastStatus != null &&
                            (lastStatus.type == StatusType.image ||
                                lastStatus.type == StatusType.video))
                        ? kIsWeb
                            ? MemoryImage(lastStatus.content as Uint8List)
                            : FileImage(lastStatus.content as File)
                        : null,
                child:
                    lastStatus == null || lastStatus.type == StatusType.text
                        ? const Icon(Icons.add, size: 24)
                        : null,
              ),
            ),
            title: const Text('My Status'),
            subtitle: Text('${myStatuses.length} update(s)'),
            onTap:
                () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => StatusViewer(statuses: myStatuses),
                  ),
                ),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Text('Recent updates', style: TextStyle(color: Colors.grey)),
          ),
          ...others.map(
            (u) => ListTile(
              leading:
                  u.profilePicture?.isNotEmpty == true
                      ? CircleAvatar(
                        radius: 26,
                        backgroundImage: NetworkImage(u.profilePicture!),
                      )
                      : const CircleAvatar(radius: 26),
              title: Text(u.username),
              subtitle: Text(u.lastMessage),
            ),
          ),
        ],
      ),
      floatingActionButton: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          FloatingActionButton(
            heroTag: 'edit',
            mini: true,
            backgroundColor: Colors.white,
            onPressed: _addText,
            child: const Icon(Icons.edit, color: Colors.grey),
          ),
          const SizedBox(height: 12),
          FloatingActionButton(
            heroTag: 'camera',
            child: const Icon(Icons.camera_alt),
            onPressed: () => _addMedia(allowVideo: true, onlyImage: false),
          ),
        ],
      ),
    );
  }
}

class StatusViewer extends StatefulWidget {
  // Changed to StatefulWidget
  final List<MyStatus> statuses;
  const StatusViewer({required this.statuses, super.key});

  @override
  _StatusViewerState createState() => _StatusViewerState();
}

class _StatusViewerState extends State<StatusViewer> {
  int _currentIndex = 0;
  Timer? _timer;
  bool _isPaused = false;

  @override
  void initState() {
    super.initState();
    _startTimer();
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  void _startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 3), (timer) {
      if (!_isPaused) {
        setState(() {
          if (_currentIndex < widget.statuses.length - 1) {
            _currentIndex++;
          } else {
            Navigator.pop(context); // Go back when all statuses are viewed
          }
        });
      }
    });
  }

  void _pauseTimer() {
    _isPaused = true;
  }

  void _resumeTimer() {
    _isPaused = false;
  }

  @override
  Widget build(BuildContext context) {
    if (widget.statuses.isEmpty) {
      return const IgnorePointer(
        // Makes the widget non-interactive
        child: Scaffold(
          body: Center(child: Text("")), // No text displayed
        ),
      );
    }

    final currentStatus = widget.statuses[_currentIndex];

    return GestureDetector(
      onTapDown: (_) => _pauseTimer(),
      onTapUp:
          (_) =>
              Future.delayed(const Duration(milliseconds: 300), _resumeTimer),
      onVerticalDragStart:
          (_) => Navigator.pop(context), // Swipe down to dismiss
      child: Scaffold(
        body: Stack(
          children: [_buildStatusContent(currentStatus), _buildProgressBar()],
        ),
      ),
    );
  }

  Widget _buildStatusContent(MyStatus status) {
    switch (status.type) {
      case StatusType.text:
        return Container(
          color: Colors.grey,
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Center(
              child: Text(
                status.content as String,
                style: const TextStyle(fontSize: 24, color: Colors.white),
              ),
            ),
          ),
        );
      case StatusType.image:
        return kIsWeb
            ? Image.memory(status.content as Uint8List, fit: BoxFit.contain)
            : Image.file(status.content as File, fit: BoxFit.contain);
      case StatusType.video:
        return Center(
          child: IconButton(
            icon: const Icon(
              Icons.play_circle_filled,
              size: 64,
              color: Colors.white,
            ),
            onPressed: () {
              // Implement video playback here (consider using a video player plugin)
            },
          ),
        );
      default:
        return const SizedBox.shrink();
    }
  }

  Widget _buildProgressBar() {
    return Positioned(
      top: 6,
      left: 0,
      right: 0,
      child: LinearProgressIndicator(
        value:
            (widget.statuses.isNotEmpty)
                ? (_currentIndex + 1) / widget.statuses.length
                : 0,

        valueColor: const AlwaysStoppedAnimation<Color>(Colors.white),
      ),
    );
  }
}
