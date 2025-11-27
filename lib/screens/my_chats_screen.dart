import 'package:flutter/material.dart';
import 'chat_screen.dart';

class MyChatsScreen extends StatefulWidget {
  const MyChatsScreen({super.key});

  @override
  State<MyChatsScreen> createState() => _MyChatsScreenState();
}

class _MyChatsScreenState extends State<MyChatsScreen> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  final List<Map<String, dynamic>> recentChats = [
    {'title': 'Recent Breakup Felt', 'total': 90, 'mood': 'Happy', 'icon': Icons.favorite},
    {'title': 'Recent Breakup Felt', 'total': 90, 'mood': 'Happy', 'icon': Icons.favorite},
    {'title': 'Recent Breakup Felt', 'total': 90, 'mood': 'Happy', 'icon': Icons.favorite},
    {'title': 'Recent Breakup Felt', 'total': 90, 'mood': 'Happy', 'icon': Icons.favorite},
  ];

  final List<Map<String, dynamic>> trashChats = [
    {'title': 'Recent Breakup Felt', 'total': 90, 'mood': 'Happy', 'icon': Icons.favorite},
    {'title': 'Recent Breakup Felt', 'total': 90, 'mood': 'Happy', 'icon': Icons.favorite},
    {'title': 'Recent Breakup Felt', 'total': 90, 'mood': 'Happy', 'icon': Icons.favorite},
    {'title': 'Recent Breakup Felt', 'total': 90, 'mood': 'Happy', 'icon': Icons.favorite},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My AI Chats'),
        centerTitle: true,
        backgroundColor: Colors.orange,
        elevation: 0,
        actions: [
          IconButton(
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Trash chats functionality')),
              );
            },
            icon: const Icon(Icons.delete_outline, color: Colors.white),
          ),
        ],
        bottom: TabBar(
          controller: _tabController,
          labelColor: Colors.white,
          unselectedLabelColor: Colors.orange[100],
          indicatorColor: Colors.white,
          tabs: const [
            Tab(text: 'Recent'),
            Tab(text: 'Trash'),
          ],
        ),
      ),
      body: SafeArea(
        child: TabBarView(
          controller: _tabController,
          children: [
            // Recent Tab
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Row(
                    children: [
                      Text(
                        'Recent (4)',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.brown[800],
                        ),
                      ),
                      const Spacer(),
                      TextButton(
                        onPressed: () {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text('See all chats')),
                          );
                        },
                        child: const Text(
                          'See All',
                          style: TextStyle(
                            color: Colors.orange,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: ListView.builder(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    itemCount: recentChats.length,
                    itemBuilder: (context, index) {
                      final chat = recentChats[index];
                      return Card(
                        margin: const EdgeInsets.only(bottom: 12.0),
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: ListTile(
                          leading: CircleAvatar(
                            backgroundColor: Colors.orange.withOpacity(0.1),
                            child: Icon(
                              chat['icon'],
                              color: Colors.orange,
                            ),
                          ),
                          title: Text(
                            chat['title'],
                            style: const TextStyle(
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          subtitle: Row(
                            children: [
                              Icon(
                                Icons.chat_bubble_outline,
                                size: 16,
                                color: Colors.grey[600],
                              ),
                              const SizedBox(width: 4),
                              Text('${chat['total']} Total'),
                              const SizedBox(width: 16),
                              Icon(
                                Icons.mood,
                                size: 16,
                                color: Colors.green,
                              ),
                              const SizedBox(width: 4),
                              Text(chat['mood']),
                            ],
                          ),
                          trailing: Icon(Icons.arrow_forward_ios, size: 16, color: Colors.grey[600]),
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const ChatScreen(),
                              ),
                            );
                          },
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
            // Trash Tab
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Row(
                    children: [
                      Text(
                        'Trash (4)',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.brown[800],
                        ),
                      ),
                      const Spacer(),
                      TextButton(
                        onPressed: () {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text('See all trash chats')),
                          );
                        },
                        child: const Text(
                          'See All',
                          style: TextStyle(
                            color: Colors.orange,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: ListView.builder(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    itemCount: trashChats.length,
                    itemBuilder: (context, index) {
                      final chat = trashChats[index];
                      return Card(
                        margin: const EdgeInsets.only(bottom: 12.0),
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: ListTile(
                          leading: CircleAvatar(
                            backgroundColor: Colors.red.withOpacity(0.1),
                            child: Icon(
                              chat['icon'],
                              color: Colors.red,
                            ),
                          ),
                          title: Text(
                            chat['title'],
                            style: const TextStyle(
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          subtitle: Row(
                            children: [
                              Icon(
                                Icons.chat_bubble_outline,
                                size: 16,
                                color: Colors.grey[600],
                              ),
                              const SizedBox(width: 4),
                              Text('${chat['total']} Total'),
                              const SizedBox(width: 16),
                              Icon(
                                Icons.mood,
                                size: 16,
                                color: Colors.green,
                              ),
                              const SizedBox(width: 4),
                              Text(chat['mood']),
                            ],
                          ),
                          trailing: IconButton(
                            onPressed: () {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(content: Text('Delete chat')),
                              );
                            },
                            icon: const Icon(Icons.delete_outline, color: Colors.red),
                          ),
                          onTap: () {
                            // Restore from trash or open
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(content: Text('Open trash chat')),
                            );
                          },
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}