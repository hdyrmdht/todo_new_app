
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_new_app/firebase_options.dart';
import 'package:todo_new_app/provider/my_provider.dart';
import 'layout/home_layout.dart';
import 'styles/theming.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';


void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
);
FirebaseFirestore.instance.disableNetwork; 
  runApp(ChangeNotifierProvider(create: (context) => MyProvider(),
    child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  
  @override
  Widget build(BuildContext context) {
     var provider=Provider.of<MyProvider>(context);
    return MaterialApp(
    locale: Locale(provider.local),
    localizationsDelegates: AppLocalizations.localizationsDelegates,
  supportedLocales: AppLocalizations.supportedLocales,
   debugShowCheckedModeBanner: false,
     initialRoute: HomeLayout.routeName,
     routes: {
      HomeLayout.routeName:(context) => HomeLayout(),
     },
      themeMode: provider.theme,
      theme:MyThemeData.lighttheme,
      darkTheme:MyThemeData.DarkTheme,
    );
  }
}

