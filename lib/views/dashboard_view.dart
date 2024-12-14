import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/dashboard_controller.dart';
import 'profile_view.dart';
import 'home_view.dart';
import 'write_recipe_view.dart';
import 'favorites_view.dart';
import 'inspiration_view.dart';

class DashboardView extends StatelessWidget {
  final DashboardController controller = Get.put(DashboardController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dashboard'),
        leading: IconButton(
          icon: Obx(() {
            return CircleAvatar(
              backgroundImage: AssetImage(controller.profileImage.value),
            );
          }),
          onPressed: () {
            Get.to(ProfileView()); // Navigasi ke halaman profile
          },
        ),
      ),
      body: Center(
        child: Text('Welcome to Dashboard'),
      ),
      bottomNavigationBar: BottomNavigationBar(
        onTap: (index) {
          // Navigasi footer sesuai index yang dipilih
          switch (index) {
            case 0:
              Get.to(HomeView());
              break;
            case 1:
              Get.to(WriteRecipeView());
              break;
            case 2:
              Get.to(FavoritesView());
              break;
            case 3:
              Get.to(InspirationView());
              break;
            case 4:
              Get.to(ProfileView());
              break;
          }
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.create),
            label: 'Tulis Resep',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: 'Favorit',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.lightbulb),
            label: 'Inspirasi',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}
