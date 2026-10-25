import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profil Mahasiswa'),
        backgroundColor: const Color(0xFFA8D8FF), // Biru muda pastel
      ),
      backgroundColor: const Color(0xFFF9FBFD),
      body: Center(
        child: Container(
          padding: const EdgeInsets.all(24.0),
          margin: const EdgeInsets.all(16.0),
          decoration: BoxDecoration(
            color: const Color(0xFFA8D8FF), // Biru muda pastel (#A8D8FF)
            borderRadius: BorderRadius.circular(16),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // Mengubah CircleAvatar menggunakan foto dari assets
              const CircleAvatar(
                radius: 50,
                backgroundColor: Color(0xFFB9E5D3), // Mint accent sebagai background cadangan
                backgroundImage: AssetImage('assets/Shafira.jpeg'), // Sesuaikan dengan nama file foto Anda
              ),
              const SizedBox(height: 16),
              const Text(
                'Shafira Fitri Citra Ramadhanti',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 8),
              const Text(
                'NIM: 240102122',
                style: TextStyle(fontSize: 16, color: Colors.black54),
              ),
              const SizedBox(height: 4),
              const Text(
                'Universitas Muhammadiyah Bandung',
                style: TextStyle(fontSize: 14, color: Colors.black54),
              ),
              const SizedBox(height: 20),
              // Tombol Edit Profil (Warna Peach #FFD6B3)
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFFFD6B3), // Peach pastel (#FFD6B3)
                  foregroundColor: Colors.black87,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                ),
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Fitur Edit Profil')),
                  );
                },
                child: const Text(
                  'Edit Profil',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}