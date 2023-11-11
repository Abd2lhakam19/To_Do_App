

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:to_do_app/home/settings/settings_tab.dart';
import 'package:to_do_app/home/task_list/show_bottom_sheet.dart';
import 'package:to_do_app/home/task_list/task_list_tab.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'package:to_do_app/my_theme.dart';
import 'package:to_do_app/provider/my_provider.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = 'home';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<MyProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          AppLocalizations.of(context)!.app_title,
          style: Theme.of(context).textTheme.bodyLarge!.copyWith(
            color: provider.appTheme==ThemeMode.light?MyTheme.whiteColor:MyTheme.blackDark
          ),
        ),
        centerTitle: true,
      ),
      bottomNavigationBar: BottomAppBar(
        color: provider.appTheme==ThemeMode.light?MyTheme.whiteColor:MyTheme.blackDark,
        shape: CircularNotchedRectangle(),
        notchMargin: 8,
        child: BottomNavigationBar(
          currentIndex: selectedIndex,
          onTap: (index) {
            selectedIndex = index;
            setState(() {});
          },
          items: [
            BottomNavigationBarItem(
              icon: Icon(
                Icons.list,
                size: 30,
              ),
              label: "",
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.settings,
                size: 30,
              ),
              label: "",
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          ShowAddTaskBottomSheet();
        },
        child: Icon(
          Icons.add,
          size: 30,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      body: tabs[selectedIndex],
    );
  }

  List<Widget> tabs = [
    TaskListTab(),
    SettingsTab(),
  ];

  void ShowAddTaskBottomSheet() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (context) => Padding(
        padding: MediaQuery.of(context).viewInsets,
        child: ShowBottomSheet(),
      ),

    );
  }
}
