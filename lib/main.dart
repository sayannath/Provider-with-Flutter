import 'package:flutter/material.dart';
import 'package:git_app/Pages/homePage.dart';
import 'package:git_app/Providers/userProvider.dart';
import 'package:provider/provider.dart';

void main() => runApp(
  ChangeNotifierProvider<UserProvider>(
    builder: (context) => UserProvider(),
    child: MaterialApp(
      home: HomePage(),
      debugShowCheckedModeBanner: false,
    ),
  )
);

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     ChangeNotifierProvider<UserProvider>(
//       builder: (context) => UserProvider(),
//       child: MaterialApp(
//         debugShowCheckedModeBanner: false,
//         home: HomePage(),
//       ),
//     );
//   }
// }
