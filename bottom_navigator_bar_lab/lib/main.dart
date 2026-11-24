import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'screen1.dart';
import 'screen2.dart';
import 'screen3.dart';
import 'screen4.dart';
import 'tab_model.dart';

void main() => runApp(const MainApp());

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => TabModel(),
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: BottomNavLab(),
      ),
    );
  }
}

/// The page itself does not watch TabModel, so the AppBar
/// does not rebuild when the tab changes.
class BottomNavLab extends StatelessWidget {
  const BottomNavLab({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Lab 05: Exercise A'),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),
      body: const TabBody(),
      bottomNavigationBar: const BottomTabBar(),
    );
  }
}

/// Shows the screen for the selected tab.
class TabBody extends StatelessWidget {
  const TabBody({super.key});

  // One widget per tab, in the same order as the bar items.
  static const List<Widget> screens = [
    Screen1(),
    Screen2(),
    Screen3(),
    Screen4(),
  ];

  @override
  Widget build(BuildContext context) {
    final int currentIndex = context.watch<TabModel>().currentIndex;
    return screens[currentIndex];
  }
}

/// The bottom bar. Only this widget and TabBody rebuild on a tap.
class BottomTabBar extends StatelessWidget {
  const BottomTabBar({super.key});

  @override
  Widget build(BuildContext context) {
    final int currentIndex = context.watch<TabModel>().currentIndex;

    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      fixedColor: Colors.white,
      backgroundColor: Colors.blue,
      iconSize: 30,
      currentIndex: currentIndex,
      onTap: (int index) => context.read<TabModel>().select(index),
      items: const [
        BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
        BottomNavigationBarItem(icon: Icon(Icons.alarm), label: 'Alarm'),
        BottomNavigationBarItem(icon: Icon(Icons.business), label: 'Business'),
        BottomNavigationBarItem(icon: Icon(Icons.school), label: 'School'),
      ],
    );
  }
}
