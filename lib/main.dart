import 'package:auvnet_internship/views/cartview/cubite/cartCubite.dart';
import 'package:auvnet_internship/views/first_page.dart';
import 'package:auvnet_internship/views/product_detils/cubite/cubite.dart';
import 'package:auvnet_internship/services/DioHellper.dart';

import 'package:auvnet_internship/views/HomeView/homeScreen.dart';
import 'package:auvnet_internship/views/HomeView/cubite/cubite.dart';
import 'package:auvnet_internship/views/catView/cubite/cubite.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final appDocumentDir = await getApplicationDocumentsDirectory();
  Hive.init(appDocumentDir.path);

  await Hive.openBox('Cart');
  Diohellper.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => HomeCubite()..GetCategory()),
        BlocProvider(create: (context) => ProductCubite()),
        BlocProvider(create: (context) => DetailsCubite()),
        BlocProvider(create: (context) => Cartcubite()),
      ],
      child: MaterialApp(
        theme: ThemeData(
          appBarTheme: AppBarTheme(backgroundColor: Colors.transparent),
          scaffoldBackgroundColor: Colors.white,
        ),
        debugShowCheckedModeBanner: false,
        home: Directionality(
            textDirection: TextDirection.rtl, child: FirstPage()),
      ),
    );
  }
}
