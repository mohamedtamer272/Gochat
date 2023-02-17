import 'package:chat/modules/Drawer.dart';
import 'package:chat/provider/UserProvider.dart';
import 'package:chat/shared/styles/MyTheme.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'modules/CreatAccount/CreatAccountScreen.dart';
import 'modules/Home/HomeScreen.dart';
import 'modules/Login/Login.Screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(ChangeNotifierProvider(
      create: (context) => UserProvider(), child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<UserProvider>(context);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'MyApp',
      initialRoute: provider.UserAuth == null
          ? LoginScreen.routeName
          : HomeScreen.routeName,
      routes: {
        LoginScreen.routeName: (c) => LoginScreen(),
        CreatAccountScreen.routeName: (c) => CreatAccountScreen(),
        HomeScreen.routeName: (c) => HomeScreen(),
      },
      theme: MyThemeData.LightTheme,
      darkTheme: MyThemeData.DarkTheme,
      themeMode: ThemeMode.light,
    );
  }
}
