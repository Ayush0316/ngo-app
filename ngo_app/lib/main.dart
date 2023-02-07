import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:ngo_app/modals/user.dart';
import 'package:ngo_app/screens/wrapper.dart';
import 'package:ngo_app/services/auth.dart';
import 'package:provider/provider.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return StreamProvider<CustUser?>.value(
      initialData: null,
      value: AuthService().user,
      child: MaterialApp(
        title: 'Ngo-App',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const Wrapper(),
      ),
    );
  }
}
