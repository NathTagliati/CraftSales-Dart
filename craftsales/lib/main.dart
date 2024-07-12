import "pages/headphone_page.dart";
import "pages/note_page.dart";
import "pages/others_page.dart";
import "pages/mouse_page.dart";
import "pages/register_page.dart";
import "pages/profile_page.dart";
import "services/auth_provider.dart";
import "firebase_options.dart";
import "pages/login_page.dart";
import "package:firebase_core/firebase_core.dart";
import "package:flutter/material.dart";
import "pages/cart_page.dart";
import "pages/company_page.dart";
import "pages/cont_page.dart";
import "pages/shop_page.dart";
import "pages/intro_page.dart";
import "package:provider/provider.dart";
import 'models/shop.dart';
import "themes/theme_provider.dart";

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(
    MultiProvider(
      providers: [ 
      ChangeNotifierProvider(create: (context) => Shop()),
      ChangeNotifierProvider(create: (context) => ThemeProvider()),
      ChangeNotifierProvider(create: (context) => UserProvider()),
      ],
      child: const MyApp(),
    )
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const IntroPage(),
      theme: Provider.of<ThemeProvider>(context).themeData,
      routes: {
        '/intro_page': (context) => const IntroPage(),
        '/shop_page': (context) => const ShopPage(),
        '/cart_page': (context) => const CartPage(),
        '/login_page': (context) => LoginPage(),
        '/cont_page': (context) => const Contpage(),
        '/company_page': (context) => const CompanyPage(),
        '/register_page': (context) => const RegisterPage(),
        '/profile_page': (context) => ProfilePage(),
        '/note_page': (context) => NotePage(),
        '/mouse_page': (context) => MousePage(),
        '/others_page': (context) => OtherPage(),
        '/headphone_page':(context) => HeadphonePage()
      },
    );
  }
}
