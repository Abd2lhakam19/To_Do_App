import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';
import 'package:to_do_app/provider/my_provider.dart';

import '../../my_theme.dart';

class ModeBottomSheet extends StatelessWidget {


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
              provider.ChangeTheme(ThemeMode.light);
              Navigator.pop(context);
            },
            child: Text(AppLocalizations.of(context)!.light,style: Theme.of(context).textTheme.bodyMedium!.copyWith(
              color: provider.appTheme==ThemeMode.light?MyTheme.primaryLight:MyTheme.whiteColor
            ),),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height*0.02,
          ),
          InkWell(
              onTap: (){
                provider.ChangeTheme(ThemeMode.dark);
                Navigator.pop(context);
              },
              child: Text(AppLocalizations.of(context)!.dark,style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                  color: provider.appTheme==ThemeMode.dark?MyTheme.primaryLight:MyTheme.blackColor
              )))
        ],
      ),
    );
  }
}
