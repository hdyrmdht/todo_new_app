import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:todo_new_app/screens/settings/butto_nsheet/button_theme_sheet.dart';
import 'package:todo_new_app/styles/colors.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../provider/my_provider.dart';
import 'butto_nsheet/button_language_sheet.dart';

class SettingsTab extends StatefulWidget {
  const SettingsTab({super.key});

  @override
  State<SettingsTab> createState() => _SettingsTabState();
}

class _SettingsTabState extends State<SettingsTab> {
  @override
  Widget build(BuildContext context) {
    var pro=Provider.of<MyProvider>(context);
    return  Padding(
      padding: const EdgeInsets.all(18.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
         AppLocalizations.of(context)!.language,
            style: Theme.of(context)
                .textTheme
                .bodyMedium!
                .copyWith(color: Theme.of(context).colorScheme.background),
          ),SizedBox(height: 10,),
          InkWell(
            onTap: () {
              showlanguagebuttonsheet(context);
            },
            child: Container(height: 50,
              padding: EdgeInsets.all( 12),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                border: Border.all(color:primary),
              ),
              child: Text(
            pro.local=="en"?AppLocalizations.of(context)!.english:AppLocalizations.of(context)!.arabic,textAlign: TextAlign.start,
                style: Theme.of(context)
                    .textTheme
                    .bodyMedium!
                    .copyWith(color: Theme.of(context).colorScheme.onSecondary),
              ),
            ),
          ),
          SizedBox(
            height: 18,
          ),
          Text(
          AppLocalizations.of(context)!.mode,
            style: Theme.of(context)
                .textTheme
                .bodyMedium!
                .copyWith(color: Theme.of(context).colorScheme.background),
          ),SizedBox(height: 10,),
          InkWell(
            onTap: () {
              showthemingbuttonsheet();
            },
            child: Container(
              padding: EdgeInsets.all( 12),
           height: 50,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                border: Border.all(color:primary),
              ),
              child: Text(
          pro.theme==ThemeMode.light? AppLocalizations.of(context)!.light:AppLocalizations.of(context)!.dark,textAlign: TextAlign.start,
                style: Theme.of(context)
                    .textTheme
                    .bodyMedium!
                    .copyWith(color:Theme.of(context).colorScheme.onSecondary),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void showlanguagebuttonsheet(BuildContext context) {
    showModalBottomSheet(
       backgroundColor: Theme.of(context).colorScheme.primary,
        shape: OutlineInputBorder(
          borderSide: BorderSide(color:primary),
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(18), topRight: Radius.circular(18)),
        ),
        context: context,
        builder: (context) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: ButtonLanguageSheet(),
          );
        });
  }

  void showthemingbuttonsheet() {
    showModalBottomSheet(
      backgroundColor: Theme.of(context).colorScheme.primary,
        shape: OutlineInputBorder(
          borderSide: BorderSide(color:primary),
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(18), topRight: Radius.circular(18)),
        ),
        context: context,
        builder: (context) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: ButtonthemeSheet(),
          );
        });
  }
}