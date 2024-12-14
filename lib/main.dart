import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'pages/welcome_page.dart'; // Import halaman utama
import 'views/login_view.dart';
import 'bindings/login_binding.dart';
import 'views/register_view.dart'; // Import halaman register
import 'bindings/register_binding.dart'; // Import binding register
import 'views/dashboard_view.dart'; // Import halaman dashboard home
import 'views/profile_view.dart'; // Import halaman profile
import 'views/write_recipe_view.dart'; // Import halaman tulis resep
import 'views/favorites_view.dart'; // Import halaman favorit
import 'views/inspiration_view.dart'; // Import halaman inspirasi
import 'bindings/dashboard_binding.dart'; // Import binding dashboard

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialRoute: '/welcome', // Set initial route
      getPages: [
        // Daftar routing
        GetPage(
          name: '/welcome',
          page: () => WelcomePage(),
        ),
        GetPage(
          name: '/login',
          page: () => LoginView(),
          binding: LoginBinding(), // Binding untuk login
        ),
        // Menambahkan route untuk halaman register
        GetPage(
          name: '/register',
          page: () => RegisterView(),
          binding: RegisterBinding(), // Binding untuk register
        ),
        // Menambahkan route untuk dashboard dan halaman-halaman lainnya
        GetPage(
          name: '/dashboard_view',
          page: () => DashboardView(),
          binding: DashboardBinding(), // Binding untuk dashboard
        ),
        GetPage(
          name: '/profile',
          page: () => ProfileView(),
        ),
        GetPage(
          name: '/write_recipe',
          page: () => WriteRecipeView(),
        ),
        GetPage(
          name: '/favorites',
          page: () => FavoritesView(),
        ),
        GetPage(
          name: '/inspiration',
          page: () => InspirationView(),
        ),
      ],
    );
  }
}
