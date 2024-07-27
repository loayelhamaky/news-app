import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:news_app/ui/screens/home/home_screen.dart';
import 'package:news_app/ui/screens/home/tabs/categories/categories_view.dart';
import 'package:news_app/ui/screens/home/tabs/news/tab_datails_articles/tab_datails_widgets/article_photo.dart';
import 'package:news_app/ui/screens/home/tabs/news/tabs_list_sources/tabs_list_view.dart';
import 'package:news_app/ui/screens/home/tabs/settings/settings_view.dart';
import 'package:news_app/ui/screens/splash/splash_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  FirebaseFirestore.instance.disableNetwork();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
      routes: {
        ArticlePhoto.routeName : (context) =>  const ArticlePhoto(),
        SettingsView.routeName : (context) => const SettingsView(),
        CategoriesView.routeName : (context) => CategoriesView(),
        SplashScreen.routeName : (context) => const SplashScreen(),
        HomeScreen.routeName : (context) => HomeScreen(),
        TabsList.routeName : (context) => const TabsList(),

      },
      initialRoute: SplashScreen.routeName,
    );
  }
}

