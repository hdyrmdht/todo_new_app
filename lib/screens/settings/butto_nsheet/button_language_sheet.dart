// ignore_for_file: unnecessary_import, implementation_imports, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:provider/provider.dart';
import 'package:todo_new_app/styles/colors.dart';
import '../../../provider/my_provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../styles/theming.dart';

class ButtonLanguageSheet extends StatelessWidget {
  const ButtonLanguageSheet({super.key});

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<MyProvider>(context);

    return Column(
      children: [
        InkWell(
          onTap: () {
            provider.changelanguage("en");
            Navigator.pop(context);
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                AppLocalizations.of(context)!.english,
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    color: provider.local == "en"
                        ? primary
                        : Theme.of(context).colorScheme.onPrimary),
              ),
              provider.local == "en"
                  ? Icon(
                      Icons.done,
                      color:primary,
                      size: 30,
                    )
                  : SizedBox(),
            ],
          ),
        ),
        InkWell(
          onTap: () {
            provider.changelanguage("ar");
            Navigator.pop(context);
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                   AppLocalizations.of(context)!.arabic,
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    color: provider.local == "ar"
                        ? primary
                        : Theme.of(context).colorScheme.onPrimary),
              ),
             provider.local == "ar"?
              Icon(
                Icons.done,
                 color:primary,
                size: 30,
              ) :  SizedBox.shrink(),
            ],
          ),
        )
      ],
    );
  }
}
