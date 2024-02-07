import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:untitled/routes/app_routes.dart';
import 'package:untitled/routes/binding.dart';
late SharedPreferences prefs;
Future<void> main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await init();
  runApp(const MyApp());
}
Future init() async {
  prefs = await SharedPreferences.getInstance();

}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        initialBinding: InitialBinding(),
      initialRoute: Routes.splashScr,
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
        getPages: page().pages
    );
  }
}

