import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../../core/locale/locale_cubit.dart';

void openLanguageDialog(BuildContext context) {
  List<Locale> supportedLocales = AppLocalizations.supportedLocales;
  List<String> languages = [
    'English',
    'Indonesian',
    '日本語',
    '中文',
  ];

  showDialog(
    context: context,
    builder: (context) => AlertDialog(
      title: Text(AppLocalizations.of(context)!.changeLanguage),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: supportedLocales
            .map((e) => ListTile(
                  onTap: () {
                    Navigator.pop(context);
                    context.read<LocaleCubit>().changeLocale(e.languageCode);
                  },
                  leading: Text(e.languageCode),
                  title: Text(languages[supportedLocales.indexOf(e)]),
                  trailing: e.languageCode ==
                          context.read<LocaleCubit>().state.languageCode
                      ? const Icon(Icons.check)
                      : null,
                ))
            .toList(),
      ),
    ),
  );
}
