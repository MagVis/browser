import 'package:browser/model/home_page_model.dart';
import 'package:flutter/material.dart';

class AdressBar extends StatelessWidget {
  const AdressBar({
    super.key,
  });

  OutlineInputBorder inputDecorator(Color color) {
    return OutlineInputBorder(
      borderSide: BorderSide(
        color: color,
        width: 2,
        strokeAlign: BorderSide.strokeAlignCenter,
      ),
      borderRadius: BorderRadius.circular(10.0),
    );
  }

  @override
  Widget build(BuildContext context) {
    final model = HomeWidgetProvider.watch(context);
    final controller = TextEditingController(text: '${model?.uri}');
    return TextField(
      controller: controller,
      textInputAction: TextInputAction.search,
      onChanged: (value) => model?.searchText = value,
      onSubmitted: (value) => model?.search(),
      onTap: () => controller.selection = TextSelection(
          baseOffset: 0, extentOffset: controller.value.text.length),
      style: const TextStyle(color: Colors.white),
      decoration: InputDecoration(
        border: const OutlineInputBorder(),
        enabledBorder: inputDecorator(Colors.white),
        focusedBorder: inputDecorator(Colors.purple),
      ),
    );
  }
}
