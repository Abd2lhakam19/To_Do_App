import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:to_do_app/my_theme.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:to_do_app/provider/my_provider.dart';

class LanguageBottomSheet extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<MyProvider>(context);
    return Container(
      color: provider.appTheme == ThemeMode.light
          ? MyTheme.whiteColor
          : MyTheme.blackDark,
      height: MediaQuery.of(context).size.height*0.2,
      padding: EdgeInsets.all(15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          InkWell(
            onTap: (){
              provider.ChangeLanguage("en");
              Navigator.pop(context);
            },
            child: Text(AppLocalizations.of(context)!.english,style: Theme.of(context).textTheme.bodyMedium!.copyWith(
              color: provider.local=='en'?MyTheme.primaryLight:MyTheme.blackColor
            ),),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height*0.02,
          ),
          InkWell(
            onTap: (){
              provider.ChangeLanguage('ar');
              Navigator.pop(context);
            },
              child: Text(AppLocalizations.of(context)!.arabic,style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                color: provider.local=='ar'?MyTheme.primaryLight:MyTheme.blackColor
              )))
        ],
      ),
    );
  }
}
