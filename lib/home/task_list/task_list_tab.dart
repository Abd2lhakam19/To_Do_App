import 'package:calendar_timeline/calendar_timeline.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:to_do_app/home/task_list/task_details.dart';
import 'package:to_do_app/home/task_list/task_item.dart';
import 'package:to_do_app/my_theme.dart';
import 'package:to_do_app/provider/my_provider.dart';

class TaskListTab extends StatelessWidget {
  const TaskListTab({super.key});

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<MyProvider>(context);
    return Column(
      children: [
        CalendarTimeline(
          initialDate: DateTime.now(),
          firstDate: DateTime.now().subtract(const Duration(days: 365)),
          lastDate: DateTime.now().add(const Duration(days: 365)),
          onDateSelected: (date) => print(date),
          leftMargin: 20,
          monthColor: provider.appTheme == ThemeMode.light
              ? MyTheme.blackColor
              : MyTheme.whiteColor,
          dayColor: provider.appTheme == ThemeMode.light
              ? MyTheme.blackColor
              : MyTheme.whiteColor,
          activeDayColor: provider.appTheme == ThemeMode.light
              ? MyTheme.whiteColor
              : MyTheme.blackDark,
          activeBackgroundDayColor: MyTheme.primaryLight,
          dotsColor: provider.appTheme == ThemeMode.light
              ? MyTheme.whiteColor
              : MyTheme.blackDark,
          locale: provider.local,
          dayHeight: 75,
          monthHeight: 30,
        ),
        Expanded(
          child: ListView.builder(
            itemBuilder: (context, index) {
              return InkWell(
                  onTap: () {
                    Navigator.pushNamed(context, TaskDetails.routeName);
                  },
                  child: TaskItem());
            },
            itemCount: 10,
          ),
        )
      ],
    );
  }
}
