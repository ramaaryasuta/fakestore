import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

void notAvaiableDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (context) => AlertDialog(
      title: Text(AppLocalizations.of(context)!.auth),
      content: Text(AppLocalizations.of(context)!.notAvaiableRightNow),
    ),
  );
}
