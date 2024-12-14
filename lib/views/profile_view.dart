import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/profile_controller.dart';

class ProfileView extends StatelessWidget {
  final ProfileController controller = Get.put(ProfileController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Get.back(); // Navigasi kembali ke halaman sebelumnya
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          children: [
            SizedBox(height: 40),
            // Gambar profil
            Obx(() {
              return CircleAvatar(
                radius: 60,
                backgroundImage: controller.profileImage.value.isEmpty
                    ? AssetImage('assets/default_profile.png')
                    : NetworkImage(controller.profileImage.value),
                backgroundColor: Colors.grey[200],
              );
            }),
            SizedBox(height: 20),
            // Nama pengguna
            Obx(() {
              return Text(
                controller.name.value.isEmpty ? 'Nama Pengguna' : controller.name.value,
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              );
            }),
            SizedBox(height: 10),
            // Email pengguna
            Obx(() {
              return Text(
                controller.email.value.isEmpty ? 'Email Pengguna' : controller.email.value,
                style: TextStyle(fontSize: 18),
              );
            }),
            SizedBox(height: 30),
            // Tombol untuk mengubah foto profil
            ElevatedButton(
              onPressed: () {
                // Misalnya, Anda dapat menggunakan dialog untuk memilih gambar baru
                controller.updateProfileImage('https://link-to-new-image.com');
              },
              child: Text('Ganti Foto Profil'),
            ),
            SizedBox(height: 20),
            // Tombol untuk mengedit informasi pengguna
            ElevatedButton(
              onPressed: () {
                // Misalnya, Anda bisa menampilkan dialog atau halaman baru untuk mengubah nama dan email
                controller.updateUserInfo('Nama Baru', 'emailbaru@example.com');
              },
              child: Text('Edit Info Pengguna'),
            ),
          ],
        ),
      ),
    );
  }
}
