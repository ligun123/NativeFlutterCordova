import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_module/bloc/global/global_inherited.dart';

class MineView extends StatefulWidget {
  const MineView({super.key});

  static Route route() =>
      MaterialPageRoute(builder: (context) => const MineView());

  @override
  State<MineView> createState() => _MineViewState();
}

class _MineViewState extends State<MineView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.mineViewTitle),
      ),
      body: Center(
        child: MaterialButton(
          onPressed: () {
            final locale = Locale("zh");
            GlobalInheritedWidget.of(context)
                ?.localeController
                .updateLocale(locale);
          },
          child: Text("change local"),
        ),
      ),
    );
  }
}