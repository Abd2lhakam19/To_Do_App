import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:provider/provider.dart';
import 'package:to_do_app/my_theme.dart';
import 'package:to_do_app/provider/my_provider.dart';

class TaskItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<MyProvider>(context);
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Slidable(
        startActionPane: ActionPane(
          extentRatio: 0.2,
          motion: const BehindMotion(),
          children: [
            SlidableAction(
              onPressed: (context) {},
              backgroundColor: MyTheme.redColor,
              foregroundColor: Colors.white,
              icon: Icons.delete,
              label: 'Delete',
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(15),
                bottomLeft: Radius.circular(15),
              ),
            ),
          ],
        ),
        child: Container(
          padding: EdgeInsets.all(12),
          decoration: BoxDecoration(
              color: provider.appTheme == ThemeMode.light
                  ? MyTheme.whiteColor
                  : MyTheme.blackDark,
              borderRadius: BorderRadius.circular(15)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                color: MyTheme.primaryLight,
                height: MediaQuery.of(context).size.height * 0.09,
                width: 4,
              ),
              SizedBox(
                width: 12,
              ),
              Expanded(
                  child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    "Task Title",
                    style: Theme.of(context)
                        .textTheme
                        .bodyMedium!
                        .copyWith(color: MyTheme.primaryLight),
                  ),
                  Text("Des",
                      style: Theme.of(context).textTheme.bodySmall!.copyWith(
                          color: provider.appTheme == ThemeMode.light
                              ? MyTheme.blackColor
                              : MyTheme.whiteColor))
                ],
              )),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 15, vertical: 4),
                decoration: BoxDecoration(
                    color: MyTheme.primaryLight,
                    borderRadius: BorderRadius.circular(12)),
                child: Icon(
                  Icons.check,
                  color: MyTheme.whiteColor,
                  size: 35,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
