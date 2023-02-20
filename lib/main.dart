import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';

import 'routes.dart';
import 'theme.dart';

final navigatorKey = GlobalKey<NavigatorState>();
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const App());
}

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  final Future<FirebaseApp> _initialization = Firebase.initializeApp();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _initialization,
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return const Text('error');
        }
        if (snapshot.connectionState == ConnectionState.done) {
          return MaterialApp(
            navigatorKey: navigatorKey,
            routes: appRoutes,
            theme: appTheme,
          );
        }
        return const Text('loading');
      },
    );
  }
}
