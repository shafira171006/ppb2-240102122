import 'package:flutter/material.dart';
import '../model/user_model.dart';
import '../service/api_service.dart';

class UserListPage extends StatefulWidget {
  const UserListPage({super.key});

  @override
  UserListPageState createState() => UserListPageState();
}

class UserListPageState extends State<UserListPage> {
  final ApiService apiService = ApiService();
  late Future<List<User>> futureUsers;

  @override
  void initState() {
    super.initState();
    loadData();
  }

  void loadData() {
    setState(() {
      futureUsers = apiService.fetchUsers();
    });
  }

  Future<void> _onRefresh() async {
    loadData();
    try {
      await futureUsers;
    } catch (e) {
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Gagal load — cek koneksi')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Daftar Mahasiswa'),
        backgroundColor: const Color(0xFFA8D8FF), // Biru muda pastel (#A8D8FF)
      ),
      body: RefreshIndicator(
        onRefresh: _onRefresh,
        color: const Color(0xFFFFD6B3), // Peach pastel loading (#FFD6B3)
        child: FutureBuilder<List<User>>(
          future: futureUsers,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(
                  color: Color(0xFFFFD6B3), // Peach pastel loading (#FFD6B3)
                ),
              );
            } else if (snapshot.hasError) {
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Terjadi kesalahan: ${snapshot.error}'),
                    const SizedBox(height: 8),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFFFFD6B3), // Peach pastel (#FFD6B3)
                      ),
                      onPressed: loadData,
                      child: const Text('Coba Lagi', style: TextStyle(color: Colors.black)),
                    ),
                  ],
                ),
              );
            } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
              return const Center(child: Text('Tidak ada data'));
            }

            List<User> users = snapshot.data!;
            return ListView.builder(
              itemCount: users.length,
              itemBuilder: (context, index) {
                User user = users[index];
                return Container(
                  margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  decoration: BoxDecoration(
                    color: const Color(0xFFA8D8FF), // Biru muda pastel (#A8D8FF)
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: ListTile(
                    leading: CircleAvatar(
                      backgroundColor: const Color(0xFFB9E5D3), // Mint accent (#B9E5D3)
                      child: Text(
                        user.name.isNotEmpty ? user.name[0] : '',
                        style: const TextStyle(color: Colors.black87),
                      ),
                    ),
                    title: Text(
                      user.name,
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    subtitle: Text('${user.email}\nUsername: ${user.username}'),
                    isThreeLine: true,
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }
}