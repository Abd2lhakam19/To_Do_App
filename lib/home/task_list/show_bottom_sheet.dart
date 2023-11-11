import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';
import 'package:to_do_app/my_theme.dart';
import 'package:to_do_app/provider/my_provider.dart';

class ShowBottomSheet extends StatefulWidget {
  @override
  State<ShowBottomSheet> createState() => _ShowBottomSheetState();
}

class _ShowBottomSheetState extends State<ShowBottomSheet> {
  DateTime selectedDate = DateTime.now();
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<MyProvider>(context);
    return Container(
      color: provider.appTheme == ThemeMode.light
          ? MyTheme.whiteColor
          : MyTheme.blackDark,
      padding: EdgeInsets.all(13),
      height: MediaQuery.of(context).size.height * 0.49,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            AppLocalizations.of(context)!.add_new_task,
            style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                  color: provider.appTheme == ThemeMode.light
                      ? MyTheme.blackColor
                      : MyTheme.whiteColor,
                ),
          ),
          Form(
            key: formKey,
            child: Column(
              children: [
                TextFormField(
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return AppLocalizations.of(context)!.errorField1;
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                      errorStyle: TextStyle(fontSize: 14),
                      labelText: AppLocalizations.of(context)?.task_title,
                      labelStyle: TextStyle(
                        color: provider.appTheme == ThemeMode.light
                            ? MyTheme.blackColor
                            : MyTheme.whiteColor,
                      )),
                ),
                TextFormField(
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return AppLocalizations.of(context)!.errorField2;
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    errorStyle: TextStyle(fontSize: 14),
                    labelText: AppLocalizations.of(context)?.task_description,
                    labelStyle: TextStyle(
                      color: provider.appTheme == ThemeMode.light
                          ? MyTheme.blackColor
                          : MyTheme.whiteColor,
                    ),
                  ),
                  maxLines: 3,
                ),
              ],
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.02,
          ),
          Text(
            AppLocalizations.of(context)!.select_date,
            style: Theme.of(context).textTheme.bodySmall!.copyWith(
                  color: provider.appTheme == ThemeMode.light
                      ? MyTheme.blackColor
                      : MyTheme.whiteColor,
                ),
          ),
          InkWell(
            onTap: () {
              ShowCalender();
            },
            child: Text(
              "${selectedDate.toString().substring(0, 10)}",
              style: Theme.of(context).textTheme.bodySmall!.copyWith(
                    color: provider.appTheme == ThemeMode.light
                        ? MyTheme.blackColor
                        : MyTheme.whiteColor,
                  ),
              textAlign: TextAlign.center,
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.01,
          ),
          ElevatedButton(
            onPressed: () {
              AddTask();
            },
            child: Text(AppLocalizations.of(context)!.add_task,
                style: Theme.of(context).textTheme.bodySmall!.copyWith(
                      color: provider.appTheme == ThemeMode.light
                          ? MyTheme.blackColor
                          : MyTheme.whiteColor,
                    )),
          )
        ],
      ),
    );
  }

  void ShowCalender() async {
    var chosenDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now().subtract(Duration(days: 365)),
      lastDate: DateTime.now().add(Duration(days: 365)),
    );
    if (chosenDate != null) {
      selectedDate = chosenDate;
    }
    setState(() {});
  }

  void AddTask() {
    if (formKey.currentState!.validate() != null) {
      //
    }
  }
}
