import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';
import 'package:to_do_app/provider/my_provider.dart';

import '../../my_theme.dart';

class TaskDetails extends StatefulWidget {
  static const String routeName = "taskDetails";

  @override
  State<TaskDetails> createState() => _TaskDetailsState();
}

class _TaskDetailsState extends State<TaskDetails> {
  final formKey = GlobalKey<FormState>();
  DateTime selectedDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<MyProvider>(context);
    return Scaffold(
        appBar: AppBar(
          title: Text(
            AppLocalizations.of(context)!.app_title,
            style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                color: provider.appTheme == ThemeMode.light
                    ? MyTheme.whiteColor
                    : MyTheme.blackDark),
          ),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Container(
            decoration: BoxDecoration(
                color: provider.appTheme == ThemeMode.light
                    ? MyTheme.whiteColor
                    : MyTheme.blackDark,
                borderRadius: BorderRadius.circular(20)),
            padding: EdgeInsets.all(15),
            margin: EdgeInsets.all(25),
            height: MediaQuery.of(context).size.height * 0.7,
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
                        style: Theme.of(context).textTheme.bodySmall!.copyWith(
                          color: provider.appTheme==ThemeMode.light?MyTheme.blackColor:MyTheme.whiteColor
                        ),
                        decoration: InputDecoration(
                          errorStyle: TextStyle(fontSize: 14),
                          labelText: AppLocalizations.of(context)?.task_title,
                          labelStyle: TextStyle(
                            color: provider.appTheme == ThemeMode.light
                                ? MyTheme.blackColor
                                : MyTheme.whiteColor,
                          ),
                        ),
                      ),
                      TextFormField(
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return AppLocalizations.of(context)!.errorField2;
                          }
                          return null;
                        },
                        style: Theme.of(context).textTheme.bodySmall!.copyWith(
                            color: provider.appTheme==ThemeMode.light?MyTheme.blackColor:MyTheme.whiteColor
                        ),
                        decoration: InputDecoration(
                          errorStyle: TextStyle(fontSize: 14),
                          labelText:
                              AppLocalizations.of(context)?.task_description,
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
                  height: MediaQuery.of(context).size.height * 0.03,
                ),
                Text(
                  AppLocalizations.of(context)!.select_date,
                  style: Theme.of(context).textTheme.bodySmall!.copyWith(
                        color: provider.appTheme == ThemeMode.light
                            ? MyTheme.blackColor
                            : MyTheme.whiteColor,
                      ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.05,
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
                  height: MediaQuery.of(context).size.height * 0.1,
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
          ),
        ));
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
