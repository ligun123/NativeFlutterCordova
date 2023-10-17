import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_module/bloc/global/global_inherited.dart';
import 'package:flutter_module/bloc/global/global_controller.dart';
import 'package:flutter_module/utils/route_generater.dart';

void main() async {
  final globalController = GlobalController()..load();
  runApp(
    MyApp(
      globalController: globalController,
    ),
  );
}

class MyApp extends StatelessWidget {
  final GlobalController globalController;
  const MyApp({
    required this.globalController,
    super.key,
  });

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    Locale sysLocale = Localizations.localeOf(context);
    return GlobalInheritedWidget(
      controller: globalController,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: '富家海外',
        theme: ThemeData(
          // This is the theme of your application.
          //
          // Try running your application with "flutter run". You'll see the
          // application has a blue toolbar. Then, without quitting the app, try
          // changing the primarySwatch below to Colors.green and then invoke
          // "hot reload" (press "r" in the console where you ran "flutter run",
          // or press Run > Flutter Hot Reload in a Flutter IDE). Notice that the
          // counter didn't reset back to zero; the application is not restarted.
          primarySwatch: Colors.blue,
        ),
        supportedLocales: AppLocalizations.supportedLocales,
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        onGenerateRoute: generateRoute,
        locale: globalController.locale,
        localeResolutionCallback: (locale, supportedLocales) {
          for (var supportedLocale in supportedLocales) {
            if (supportedLocale.languageCode == locale?.languageCode) {
              return supportedLocale;
            }
          }
          return supportedLocales.first;
        },
      ),
    );
  }
}
