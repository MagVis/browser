import 'package:browser/model/home_page_model.dart';
import 'package:browser/view/widgets/adres_bar.dart';
import 'package:browser/view/widgets/simple_button.dart';
import 'package:flutter/material.dart';

class AppBarHome extends StatelessWidget implements PreferredSizeWidget {
  const AppBarHome({super.key});

  @override
  Size get preferredSize => Size.fromHeight(70);

  @override
  Widget build(BuildContext context) {
    final model = HomeWidgetProvider.read(context)!;
    return AppBar(
      toolbarHeight: 75,
      backgroundColor: Colors.black,
      leading: SimpleButton(icon: Icons.home_outlined, onPressed: model.goHome),
      title: const AdressBar(),
      actions: [
        SimpleButton(icon: Icons.search, onPressed: model.search),
        const SizedBox(width: 10),
        SimpleButton(
            icon: Icons.keyboard_arrow_right, onPressed: model.goForward)
      ],
    );
  }
}
