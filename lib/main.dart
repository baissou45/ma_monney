import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:ma_money/pages/accueil.dart';
import 'package:ma_money/pages/auth/login.dart';
import 'package:ma_money/splash.dart';

late Box clients_box;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  // Hive.registerAdapter(ClientAdapter());
  // Hive.registerAdapter(OperationAdapter());
  // Hive.registerAdapter(ReseauxAdapter());
  // Hive.registerAdapter(CaisseAdapter());
  // Hive.registerAdapter(UserAdapter());
  // Hive.registerAdapter(FideliteAdapter());

  clients_box = await Hive.openBox("clients_box");
  runApp(const ProviderScope(child: MyApp()));
}

// void main() {
//   runApp(const MyApp());
// }

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const Splash(),
    );
  }
}
