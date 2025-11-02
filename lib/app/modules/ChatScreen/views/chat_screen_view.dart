import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/chat_screen_controller.dart';

class ChatScreenView extends GetView<ChatScreenController> {
  const ChatScreenView({super.key});

  Icon _buildStatusIcon(String status) {
    switch (status) {
      case 'sent':
        return const Icon(Icons.check, size: 14, color: Colors.grey);
      case 'delivered':
        return const Icon(Icons.done_all, size: 14, color: Colors.grey);
      case 'read':
        return const Icon(Icons.done_all, size: 14, color: Colors.green);
      default:
        return const Icon(Icons.check, size: 14, color: Colors.grey);
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    final sampleMessages = [
      {
        'text': 'Hi there!',
        'isSender': false,
        'time': '10:20 AM',
        'status': 'read',
      },
      {
        'text': 'Hello! How are you?',
        'isSender': true,
        'time': '10:21 AM',
        'status': 'read',
      },
      {
        'text': 'I am good, thanks! What about you?',
        'isSender': false,
        'time': '10:22 AM',
        'status': 'delivered',
      },
      {
        'text': 'Doing well, just working on a project.',
        'isSender': true,
        'time': '10:23 AM',
        'status': 'sent',
      },
      {
        'text': 'Sounds great!',
        'isSender': false,
        'time': '10:24 AM',
        'status': 'read',
      },
    ];

    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            CircleAvatar(
              backgroundColor: isDark ? Colors.grey[700] : Colors.grey[300],
              child: const Icon(Icons.person, color: Colors.white),
            ),
            const SizedBox(width: 10),
            const Text('Chat Partner'),
          ],
        ),
        centerTitle: false,
        actions: [
          PopupMenuButton<String>(
            icon: const Icon(Icons.more_vert),
            onSelected: (value) {
              switch (value) {
                case 'report':
                  // TODO: Add report logic
                  break;
                case 'clear':
                  // TODO: Add clear chat logic
                  break;
                case 'delete':
                  // TODO: Add delete chat logic
                  break;
                case 'block':
                  // TODO: Add block user logic
                  break;
              }
            },
            itemBuilder: (context) => [
              const PopupMenuItem(value: 'report', child: Text('Report')),
              const PopupMenuItem(value: 'clear', child: Text('Clear Chat')),
              const PopupMenuItem(value: 'delete', child: Text('Delete Chat')),
              const PopupMenuItem(value: 'block', child: Text('Block')),
            ],
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              itemCount: sampleMessages.length,
              itemBuilder: (context, index) {
                final message = sampleMessages[index];
                final isSender = message['isSender'] as bool;
                final bgColor = isSender
                    ? (isDark ? Colors.deepPurple[700] : Colors.deepPurple[300])
                    : (isDark ? Colors.grey[800] : Colors.grey[200]);
                final textColor = isSender
                    ? Colors.white
                    : (isDark ? Colors.white70 : Colors.black87);
                final align = isSender
                    ? CrossAxisAlignment.end
                    : CrossAxisAlignment.start;
                final radius = BorderRadius.only(
                  topLeft: const Radius.circular(12),
                  topRight: const Radius.circular(12),
                  bottomLeft: Radius.circular(isSender ? 12 : 0),
                  bottomRight: Radius.circular(isSender ? 0 : 12),
                );

                bool showAvatar = true;
                if (index < sampleMessages.length - 1) {
                  final nextIsSameSender =
                      sampleMessages[index + 1]['isSender'] ==
                      message['isSender'];
                  showAvatar = !nextIsSameSender;
                }

                Widget avatar = CircleAvatar(
                  radius: 14,
                  backgroundColor: isDark ? Colors.grey[700] : Colors.grey[300],
                  child: const Icon(
                    Icons.person,
                    size: 16,
                    color: Colors.white,
                  ),
                );

                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 4),
                  child: Row(
                    mainAxisAlignment: isSender
                        ? MainAxisAlignment.end
                        : MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      if (!isSender && showAvatar) ...[
                        avatar,
                        const SizedBox(width: 8),
                      ],
                      Column(
                        crossAxisAlignment: align,
                        children: [
                          Container(
                            constraints: BoxConstraints(
                              maxWidth: MediaQuery.of(context).size.width * 0.7,
                            ),
                            padding: const EdgeInsets.symmetric(
                              horizontal: 16,
                              vertical: 10,
                            ),
                            decoration: BoxDecoration(
                              color: bgColor,
                              borderRadius: radius,
                            ),
                            child: Text(
                              message['text'] as String,
                              style: theme.textTheme.bodyMedium?.copyWith(
                                color: textColor,
                              ),
                            ),
                          ),
                          const SizedBox(height: 4),
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: isSender
                                ? MainAxisAlignment.end
                                : MainAxisAlignment.start,
                            children: [
                              Text(
                                message['time'] as String,
                                style: theme.textTheme.bodySmall?.copyWith(
                                  color: Colors.grey,
                                ),
                              ),
                              if (isSender) ...[
                                const SizedBox(width: 4),
                                _buildStatusIcon(message['status'] as String),
                              ],
                            ],
                          ),
                        ],
                      ),
                      if (isSender && showAvatar) ...[
                        const SizedBox(width: 8),
                        avatar,
                      ],
                    ],
                  ),
                );
              },
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
            decoration: BoxDecoration(
              color: isDark ? Colors.grey[900] : Colors.grey[100],
              boxShadow: [
                BoxShadow(
                  color: isDark ? Colors.black54 : Colors.grey.withOpacity(0.3),
                  offset: const Offset(0, -1),
                  blurRadius: 4,
                ),
              ],
            ),
            child: Row(
              children: [
                CircleAvatar(
                  backgroundColor: Colors.transparent,
                  child: IconButton(
                    icon: Icon(Icons.add, color: theme.colorScheme.primary),
                    onPressed: () {
                      showModalBottomSheet(
                        context: context,
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.vertical(
                            top: Radius.circular(20),
                          ),
                        ),
                        builder: (_) {
                          return Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              ListTile(
                                leading: const Icon(Icons.image),
                                title: const Text('Send Image'),
                                onTap: () {
                                  Navigator.pop(context);
                                  // TODO: implement image picker
                                },
                              ),
                              ListTile(
                                leading: const Icon(Icons.insert_drive_file),
                                title: const Text('Send File'),
                                onTap: () {
                                  Navigator.pop(context);
                                  // TODO: implement file picker
                                },
                              ),
                            ],
                          );
                        },
                      );
                    },
                  ),
                ),
                const SizedBox(width: 8),
                CircleAvatar(
                  backgroundColor: theme.colorScheme.primary,
                  child: IconButton(
                    icon: const Icon(Icons.mic, color: Colors.white),
                    onPressed: () {
                      // TODO: implement audio recording or voice message feature
                    },
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: 'Type a message',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: BorderSide.none,
                      ),
                      fillColor: isDark ? Colors.grey[800] : Colors.white,
                      filled: true,
                      contentPadding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 0,
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                CircleAvatar(
                  backgroundColor: theme.colorScheme.primary,
                  child: IconButton(
                    icon: const Icon(Icons.send, color: Colors.white),
                    onPressed: () {},
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
