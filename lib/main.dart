import 'package:flutter/material.dart';
import 'package:movieapp/src/common/constants/strings.dart';

// pages
import 'package:movieapp/src/features/home/home_page.dart';

void main() {
  runApp(const MyApp());
  // runApp(
  //   SplashPage(
  //     key: UniqueKey(),
  //     onInitializationComplete: () => const ProviderScope(child: MyApp()),
  //   ),
  // );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: AppStrings.kAppName,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      initialRoute: "/",
      routes: {
        "/": (BuildContext context) => const Homepage(),
      },
    );
  }
}
