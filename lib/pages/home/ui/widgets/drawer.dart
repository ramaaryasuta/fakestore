import 'package:fakestore_cubit/pages/home/ui/utils/not_avaiable_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../utils/language_dialog.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SafeArea(
        child: Column(
          children: [
            buildUserAccount(context),
            ListTile(
              onTap: () {
                openLanguageDialog(context);
              },
              leading: Icon(Icons.language_outlined),
              title: Text(AppLocalizations.of(context)!.changeLanguage),
            )
          ],
        ),
      ),
    );
  }

  Row buildUserAccount(BuildContext context) {
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.all(10),
          child: CircleAvatar(
            radius: 30,
            child: Icon(Icons.person),
          ),
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                AppLocalizations.of(context)!.notLogin,
                style: Theme.of(context).textTheme.titleMedium,
              ),
              Text(
                AppLocalizations.of(context)!.pleaseLogin,
                style: Theme.of(context).textTheme.bodySmall,
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(right: 5),
          child: IconButton(
            onPressed: () {
              notAvaiableDialog(context);
            },
            icon: const Icon(Icons.login_rounded),
          ),
        )
      ],
    );
  }
}
