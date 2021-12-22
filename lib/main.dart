import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movie2/app/binding/list_binding.dart';
import 'package:movie2/app/routes/route.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: ThemeData(
        fontFamily: "NotoSansKr",
        scaffoldBackgroundColor: Colors.white,
      ),
      debugShowCheckedModeBanner: false,
      title: "Movie App",
      initialBinding: InitBinding(),
      initialRoute: "/",
      getPages: routes,
    );
  }
}
