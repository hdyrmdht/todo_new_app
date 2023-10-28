// ignore_for_file: unnecessary_import, implementation_imports, prefer_const_constructors

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:provider/provider.dart';
import 'package:todo_new_app/styles/theming.dart';

import '../../../provider/my_provider.dart';
 import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../styles/colors.dart';


class ButtonthemeSheet extends StatelessWidget {
  const ButtonthemeSheet({super.key});

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<MyProvider>(context);

    return Column(
      children: [
        InkWell(
          onTap: () {
          provider.changetheme(ThemeMode.light);
            Navigator.pop(context);
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
              AppLocalizations.of(context)!.light,
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    color: provider.theme == ThemeMode.light
                        ? primary
                        :Theme.of(context).colorScheme.onPrimary
                    ),
              ),
              provider.theme == ThemeMode.light
                  ? 
                 Icon(
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
            provider.changetheme(ThemeMode.dark);
            Navigator.pop(context);
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
              AppLocalizations.of(context)!.dark,
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    color: provider.theme == ThemeMode.dark
                        ?primary
                        : Theme.of(context).colorScheme.onPrimary
                    ),
              ),
          provider.theme == ThemeMode.dark
                  ?
                 Icon(
                      Icons.done,
                      color:primary,
                      size: 30,
                    )
                  : SizedBox(),
            ],
          ),
        )
      ],
    );
  }
}
