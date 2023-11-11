import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:to_do_app/my_theme.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:to_do_app/provider/my_provider.dart';

import '../task_list/mode_bottom_sheet.dart';
import 'language_bottom_sheet.dart';

class SettingsTab extends StatefulWidget {
  const SettingsTab({super.key});

  @override
  State<SettingsTab> createState() => _SettingsTabState();
}

class _SettingsTabState extends State<SettingsTab> {
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<MyProvider>(context);
    return Container(
      padding: EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            AppLocalizations.of(context)!.language,
            style: Theme.of(context).textTheme.bodySmall!.copyWith(
                color: provider.appTheme==ThemeMode.dark?MyTheme.whiteColor:MyTheme.blackColor
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.02,
          ),
          InkWell(
            onTap: () {
              ShowLangBottomSheet();
            },
            child: Container(
              padding: EdgeInsets.all(10),
              width: double.infinity,
              height: MediaQuery.of(context).size.height * 0.057,
              decoration: BoxDecoration(
                  color: provider.appTheme==ThemeMode.light?MyTheme.whiteColor:MyTheme.blackColor,
                  borderRadius: BorderRadius.circular(14)),
              child: Text(
               provider.local=="en"?AppLocalizations.of(context)!.english:AppLocalizations.of(context)!.arabic,
                style: Theme.of(context)
                    .textTheme
                    .bodySmall!
                    .copyWith(color: MyTheme.primaryLight),
              ),
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.05,
          ),
          Text(
            AppLocalizations.of(context)!.mode,
            style: Theme.of(context).textTheme.bodySmall!.copyWith(
                color: provider.appTheme==ThemeMode.dark?MyTheme.whiteColor:MyTheme.blackColor
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.02,
          ),
          InkWell(
            onTap: () {
              ShowModeBottomSheet();
            },
            child: Container(
              padding: EdgeInsets.all(10),
              width: double.infinity,
              height: MediaQuery.of(context).size.height * 0.057,
              decoration: BoxDecoration(
                  color:  provider.appTheme==ThemeMode.light?MyTheme.whiteColor:MyTheme.blackColor,
                  borderRadius: BorderRadius.circular(14)),
              child: Text(
                provider.appTheme==ThemeMode.light?AppLocalizations.of(context)!.light:AppLocalizations.of(context)!.dark,
                style: Theme.of(context)
                    .textTheme
                    .bodySmall!
                    .copyWith(color: MyTheme.primaryLight),
              ),
            ),
          )
        ],
      ),
    );
  }

  void ShowLangBottomSheet() {
    showModalBottomSheet(
      context: context,
      builder: (context) => LanguageBottomSheet(),
    );
  }
  void ShowModeBottomSheet() {
    showModalBottomSheet(
      context: context,
      builder: (context) => ModeBottomSheet(),
    );
  }
}
