import 'package:deliveryproyect/src/helpers/dependency_injection.dart';
import 'package:deliveryproyect/src/routes/pages.dart';
import 'package:deliveryproyect/src/ui/global_controler/cart_controller.dart';
import 'package:deliveryproyect/src/ui/global_controler/notification_controller.dart';
import 'package:deliveryproyect/src/utils/colors.dart';
import 'package:deliveryproyect/src/utils/font_style.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void dispose() {
    DependencyInjection.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<CartController>(create: (_) => CartController()),
        ChangeNotifierProvider<NotificationControler>(
          create: (_) => NotificationControler(),
        ),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
            indicatorColor: primaryColor,
            primaryColor: primaryColor,
            primarySwatch: Colors.orange,
            textTheme: MyFontStyles.textTheme,
            cupertinoOverrideTheme: CupertinoThemeData(
                //barBackgroundColor: primaryColor,
                //scaffoldBackgroundColor: primaryColor,
                //primaryContrastingColor: primaryColor,
                //primaryColor: primaryColor,
                textTheme:
                    CupertinoTextThemeData(textStyle: MyFontStyles.normal))),
        initialRoute: Pages.INITIAL,
        routes: Pages.routes,
      ),
    );
  }
}
