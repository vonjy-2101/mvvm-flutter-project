import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:toggle_switch/toggle_switch.dart';

import '../../core/app_theme.dart';
import '../../core/log.dart';

class AppHeader extends ConsumerWidget implements PreferredSizeWidget{

    String titlePage;
    AppHeader({required this.titlePage});

    @override
    Widget build(BuildContext context, WidgetRef ref) {

        return AppBar(
            title: Text(titlePage),
            actions: [
                ToggleSwitch(
                    minWidth: 90.0,
                    cornerRadius: 20.0,
                    activeBgColors: [[Colors.green[800]!], [Colors.red[800]!]],
                    activeFgColor: Colors.white,
                    inactiveBgColor: Colors.grey,
                    inactiveFgColor: Colors.white,
                    initialLabelIndex: (Theme.of(context).brightness == Brightness.dark) ? 0 : 1,
                    totalSwitches: 2,
                    labels: ['Dark', 'Light'],
                    radiusStyle: true,
                    onToggle: (index) {
                        console(index);
                        if(index == 0){ ref.read(themeModeProvider.notifier).state = ThemeMode.dark;}
                        if(index == 1){ ref.read(themeModeProvider.notifier).state = ThemeMode.light;}
                    },
                ),
            ],
        );
    }
    
    @override
    // TODO: implement preferredSize
    Size get preferredSize => const Size.fromHeight(kToolbarHeight);
    
}