import 'package:flutter/material.dart';
import 'package:session/user_model.dart';

import 'api_class.dart';

class ApiCardScreen extends StatefulWidget {
  const ApiCardScreen({Key? key}) : super(key: key);

  @override
  State<ApiCardScreen> createState() => _ApiCardScreenState();
}

class _ApiCardScreenState extends State<ApiCardScreen> {
  late Future<List<UserModel>> _futureUsers;

  @override
  void initState() {
    super.initState();
    _futureUsers = ApiService().fetchUsers();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      appBar: AppBar(title: const Text('User Data'),
          actions: [
            ElevatedButton(onPressed: (){
              Navigator.pop(context);
            },child: Icon(Icons.arrow_back))
        ],
      ),
      body: FutureBuilder<List<UserModel>>(
        future: _futureUsers,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          }
          final users = snapshot.data ?? [];
          if (users.isEmpty) {
            return const Center(child: Text('No users found'));
          }
          return ListView.builder(
            padding: const EdgeInsets.all(12),
            itemCount: users.length,
            itemBuilder: (context, index) {
              final u = users[index];
              return Card(
                elevation: 3,
                margin: const EdgeInsets.symmetric(vertical: 8),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                child: Padding(
                  padding: const EdgeInsets.all(12),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          CircleAvatar(
                            child: Text(u.name.isNotEmpty ? u.name[0] : '?'),
                          ),
                          const SizedBox(width: 12),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(u.name, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                                const SizedBox(height: 4),
                                Text('@${u.username}', style: const TextStyle(color: Colors.grey)),
                              ],
                            ),
                          ),
                          Text(u.id.toString(), style: const TextStyle(color: Colors.black54)),
                        ],
                      ),
                      const SizedBox(height: 10),
                      Row(
                        children: [
                          const Icon(Icons.email, size: 16),
                          const SizedBox(width: 6),
                          Flexible(child: Text(u.email)),
                        ],
                      ),
                      const SizedBox(height: 6),
                      Row(
                        children: [
                          const Icon(Icons.phone, size: 16),
                          const SizedBox(width: 6),
                          Flexible(child: Text(u.phone)),
                        ],
                      ),
                      const SizedBox(height: 6),
                      Row(
                        children: [
                          const Icon(Icons.language, size: 16),
                          const SizedBox(width: 6),
                          Flexible(child: Text(u.website)),
                        ],
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}